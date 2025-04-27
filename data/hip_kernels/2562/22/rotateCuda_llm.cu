#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void rotateCuda( const uint8_t * in, uint32_t rowSizeIn, uint8_t * out, uint32_t rowSizeOut, float inXStart, float inYStart, uint32_t width, uint32_t height, float cosAngle, float sinAngle )
{
    uint32_t outX = blockDim.x * blockIdx.x + threadIdx.x;
    uint32_t outY = blockDim.y * blockIdx.y + threadIdx.y;

    // Only process valid pixels within the boundary
    if ( outX < width && outY < height ) {
        const float exactInX = inXStart + cosAngle * outX + sinAngle * outY;
        const float exactInY = inYStart - sinAngle * outX + cosAngle * outY;
        const int32_t inX = static_cast<int32_t>(exactInX);
        const int32_t inY = static_cast<int32_t>(exactInY);

        // Compute output pixel address
        uint8_t *outPixel = out + outY * rowSizeOut + outX;

        // Check if input coordinates are within valid range
        if ( inX < 0 || inX >= width - 1 || inY < 0 || inY >= height - 1 ) {
            *outPixel = 0; // Set out-of-bound values to 0
        } else {
            // Compute input pixel address
            const uint8_t *inPixel = in + inY * rowSizeIn + inX;

            // Bilinear interpolation
            const float probX = exactInX - inX;
            const float probY = exactInY - inY;
            const float mean = inPixel[0] * (1 - probX) * (1 - probY) +
                               inPixel[1] * probX * (1 - probY) +
                               inPixel[rowSizeIn] * (1 - probX) * probY +
                               inPixel[rowSizeIn + 1] * probX * probY +
                               0.5f;

            *outPixel = static_cast<uint8_t>(mean);
        }
    }
}