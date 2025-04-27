#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void rotateCuda(const uint8_t *in, uint32_t rowSizeIn, uint8_t *out, uint32_t rowSizeOut, float inXStart, float inYStart, uint32_t width, uint32_t height, float cosAngle, float sinAngle) {
    uint32_t outX = blockDim.x * blockIdx.x + threadIdx.x;
    uint32_t outY = blockDim.y * blockIdx.y + threadIdx.y;

    // Check if current thread is processing a valid pixel
    if (outX < width && outY < height) {
        // Calculate transformed input coordinates using rotation
        const float exactInX = inXStart + cosAngle * outX + sinAngle * outY;
        const float exactInY = inYStart - sinAngle * outX + cosAngle * outY;

        const int32_t inX = static_cast<int32_t>(exactInX);
        const int32_t inY = static_cast<int32_t>(exactInY);

        // Calculate output pixel memory offset
        uint8_t* outputPixel = out + outY * rowSizeOut + outX;

        // Check if input coordinates are within valid image bounds
        if (inX < 0 || inX >= width - 1 || inY < 0 || inY >= height - 1) {
            *outputPixel = 0; // Set out-of-bounds pixels to 0
        } else {
            // Calculate input pixel memory offset
            const uint8_t* inputPixel = in + inY * rowSizeIn + inX;

            // Perform bilinear interpolation
            const float probX = exactInX - inX;
            const float probY = exactInY - inY;
            const float mean = *inputPixel * (1 - probX) * (1 - probY) +
                               *(inputPixel + 1) * probX * (1 - probY) +
                               *(inputPixel + rowSizeIn) * (1 - probX) * probY +
                               *(inputPixel + rowSizeIn + 1) * probX * probY + 0.5f;

            *outputPixel = static_cast<uint8_t>(mean);
        }
    }
}