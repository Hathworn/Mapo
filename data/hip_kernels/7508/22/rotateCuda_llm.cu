#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void rotateCuda(const uint8_t * in, uint32_t rowSizeIn, uint8_t * out, uint32_t rowSizeOut, float inXStart, float inYStart, uint32_t width, uint32_t height, float cosAngle, float sinAngle) {
    uint32_t outX = blockDim.x * blockIdx.x + threadIdx.x;
    uint32_t outY = blockDim.y * blockIdx.y + threadIdx.y;

    // Ensure the thread is processing a valid output pixel
    if (outX < width && outY < height) {
        // Calculate the input coordinates by inverse rotation
        const float exactInX = inXStart + cosAngle * outX + sinAngle * outY;
        const float exactInY = inYStart - sinAngle * outX + cosAngle * outY;

        const int32_t inX = static_cast<int32_t>(exactInX);
        const int32_t inY = static_cast<int32_t>(exactInY);

        uint8_t* outPix = out + outY * rowSizeOut + outX; // Pre-calculate output pixel pointer

        // Check boundary for valid input pixels
        if (inX < 0 || inX >= width - 1 || inY < 0 || inY >= height - 1) {
            *outPix = 0; // Set to 0 if out of bounds
        } else {
            const uint8_t* inPix = in + inY * rowSizeIn + inX; // Pre-calculate input pixel pointer
            const float probX = exactInX - inX;
            const float probY = exactInY - inY;
            
            // Simplified bilinear interpolation
            const float mean = inPix[0] * (1 - probX) * (1 - probY) +
                               inPix[1] * probX * (1 - probY) +
                               inPix[rowSizeIn] * (1 - probX) * probY +
                               inPix[rowSizeIn + 1] * probX * probY +
                               0.5f;
            *outPix = static_cast<uint8_t>(mean);
        }
    }
}