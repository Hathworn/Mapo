#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void rotateCuda(const uint8_t *in, uint32_t rowSizeIn, uint8_t *out, uint32_t rowSizeOut, float inXStart, float inYStart, uint32_t width, uint32_t height, float cosAngle, float sinAngle)
{
    uint32_t outX = blockDim.x * blockIdx.x + threadIdx.x;
    uint32_t outY = blockDim.y * blockIdx.y + threadIdx.y;

    // Only if this thread corresponds to a valid pixel in the output
    if (outX < width && outY < height) {
        // Calculate exact input coordinates using rotation
        float exactInX = inXStart + cosAngle * outX + sinAngle * outY;
        float exactInY = inYStart - sinAngle * outX + cosAngle * outY;

        int32_t inX = static_cast<int32_t>(exactInX);
        int32_t inY = static_cast<int32_t>(exactInY);

        // Compute output pixel position
        uint8_t *pixelOut = out + outY * rowSizeOut + outX;

        // Check input boundaries and apply bilinear interpolation if within bounds
        if (inX >= 0 && inX < width - 1 && inY >= 0 && inY < height - 1) {
            const uint8_t *pixelIn = in + inY * rowSizeIn + inX;

            // Calculate interpolation weights
            float probX = exactInX - inX;
            float probY = exactInY - inY;

            // Bilinear interpolation
            float mean = pixelIn[0] * (1 - probX) * (1 - probY) +
                         pixelIn[1] * probX * (1 - probY) +
                         pixelIn[rowSizeIn] * (1 - probX) * probY +
                         pixelIn[rowSizeIn + 1] * probX * probY + 0.5f;

            *pixelOut = static_cast<uint8_t>(mean);
        } else {
            *pixelOut = 0; // Set to 0 if out-of-bounds
        }
    }
}