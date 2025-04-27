#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void rotateCuda(const uint8_t * in, uint32_t rowSizeIn, uint8_t * out, uint32_t rowSizeOut, float inXStart, float inYStart, uint32_t width, uint32_t height, float cosAngle, float sinAngle)
{
    uint32_t outX = blockDim.x * blockIdx.x + threadIdx.x;
    uint32_t outY = blockDim.y * blockIdx.y + threadIdx.y;

    // Check if the thread is within the output bounds
    if (outX < width && outY < height) {
        // Calculate exact input coordinates
        float exactInX = inXStart + cosAngle * outX + sinAngle * outY;
        float exactInY = inYStart - sinAngle * outX + cosAngle * outY;
        
        int32_t inX = static_cast<int32_t>(exactInX);
        int32_t inY = static_cast<int32_t>(exactInY);

        // Optimize thread output calculation
        uint32_t outIndex = outY * rowSizeOut + outX;

        // Ensure input coordinates are within bounds
        if (inX < 0 || inX >= width - 1 || inY < 0 || inY >= height - 1) {
            out[outIndex] = 0;
        } else {
            // Calculate input index and optimize bilinear interpolation
            uint32_t inIndex = inY * rowSizeIn + inX;
            float probX = exactInX - inX;
            float probY = exactInY - inY;

            float mean = in[inIndex] * (1 - probX) * (1 - probY) +
                         in[inIndex + 1] * probX * (1 - probY) +
                         in[inIndex + rowSizeIn] * (1 - probX) * probY +
                         in[inIndex + rowSizeIn + 1] * probX * probY + 0.5f;

            out[outIndex] = static_cast<uint8_t>(mean);
        }
    }
}