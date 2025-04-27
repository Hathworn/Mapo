#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void rotateCuda(const uint8_t * in, uint32_t rowSizeIn, uint8_t * out, uint32_t rowSizeOut, float inXStart, float inYStart, uint32_t width, uint32_t height, float cosAngle, float sinAngle)
{
    uint32_t outX = blockDim.x * blockIdx.x + threadIdx.x;
    uint32_t outY = blockDim.y * blockIdx.y + threadIdx.y;

    // Only process valid pixels in the output
    if (outX < width && outY < height) {
        // Calculate input coordinates using inverse rotation
        float exactInX = inXStart + cosAngle * outX + sinAngle * outY;
        float exactInY = inYStart - sinAngle * outX + cosAngle * outY;

        int32_t inX = static_cast<int32_t>(exactInX);
        int32_t inY = static_cast<int32_t>(exactInY);

        // Calculate output offset
        uint8_t* outPtr = out + outY * rowSizeOut + outX;

        // Check input boundaries for bilinear interpolation
        if (inX < 0 || inX >= width - 1 || inY < 0 || inY >= height - 1) {
            *outPtr = 0; // Set value to 0 if out of bounds
        } else {
            // Calculate input offset
            const uint8_t* inPtr = in + inY * rowSizeIn + inX;

            // Bilinear interpolation
            float probX = exactInX - inX;
            float probY = exactInY - inY;
            float mean =  *inPtr * (1 - probX) * (1 - probY) +
                         *(inPtr + 1) * probX * (1 - probY) +
                         *(inPtr + rowSizeIn) * (1 - probX) * probY +
                         *(inPtr + rowSizeIn + 1) * probX * probY + 0.5f;

            *outPtr = static_cast<uint8_t>(mean);
        }
    }
}