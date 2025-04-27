#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void rotateCuda(const uint8_t *in, uint32_t rowSizeIn, uint8_t *out, uint32_t rowSizeOut, float inXStart, float inYStart, uint32_t width, uint32_t height, float cosAngle, float sinAngle) {
    uint32_t outX = blockDim.x * blockIdx.x + threadIdx.x;
    uint32_t outY = blockDim.y * blockIdx.y + threadIdx.y;

    // Check if the thread corresponds to a valid pixel
    if (outX < width && outY < height) {
        // Compute the input coordinates for the current output pixel
        const float exactInX = inXStart + cosAngle * outX + sinAngle * outY;
        const float exactInY = inYStart - sinAngle * outX + cosAngle * outY;

        const int32_t inX = static_cast<int32_t>(exactInX);
        const int32_t inY = static_cast<int32_t>(exactInY);

        // Calculate the location of the output pixel
        uint8_t *outPixel = out + outY * rowSizeOut + outX;

        // Validate input coordinates
        if (inX >= 0 && inX < static_cast<int32_t>(width) - 1 && inY >= 0 && inY < static_cast<int32_t>(height) - 1) {
            // Calculate the position of the input pixel
            const uint8_t *inPixel = in + inY * rowSizeIn + inX;

            // Perform bilinear interpolation
            const float probX = exactInX - inX;
            const float probY = exactInY - inY;
            const float mean = *inPixel * (1 - probX) * (1 - probY) +
                               *(inPixel + 1) * probX * (1 - probY) +
                               *(inPixel + rowSizeIn) * (1 - probX) * probY +
                               *(inPixel + rowSizeIn + 1) * probX * probY +
                               0.5f;

            *outPixel = static_cast<uint8_t>(mean);
        } else {
            *outPixel = 0; // Default to 0 for out of bounds
        }
    }
}