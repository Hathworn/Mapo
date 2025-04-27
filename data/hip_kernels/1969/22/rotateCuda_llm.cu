#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void rotateCuda(const uint8_t *in, uint32_t rowSizeIn, uint8_t *out, uint32_t rowSizeOut, float inXStart, float inYStart, uint32_t width, uint32_t height, float cosAngle, float sinAngle)
{
    // Calculate output pixel coordinates
    uint32_t outX = blockDim.x * blockIdx.x + threadIdx.x;
    uint32_t outY = blockDim.y * blockIdx.y + threadIdx.y;

    // Check if the thread is within output image bounds
    if (outX < width && outY < height)
    {
        // Compute exact input coordinates using inverse rotation
        const float exactInX = inXStart + cosAngle * outX + sinAngle * outY;
        const float exactInY = inYStart - sinAngle * outX + cosAngle * outY;
        
        // Convert to integer coordinates for input image
        const int32_t inX = static_cast<int32_t>(exactInX);
        const int32_t inY = static_cast<int32_t>(exactInY);

        // Update output pointer index
        out += outY * rowSizeOut + outX;

        // Validate input pixel is within bounds for bilinear interpolation
        if (inX >= 0 && inX < width - 1 && inY >= 0 && inY < height - 1)
        {
            // Update input pointer index
            in += inY * rowSizeIn + inX;

            // Calculate interpolation weights
            const float probX = exactInX - inX;
            const float probY = exactInY - inY;

            // Perform bilinear interpolation and round the result
            const float mean = *in * (1.0f - probX) * (1.0f - probY) +
                               *(in + 1) * probX * (1.0f - probY) +
                               *(in + rowSizeIn) * (1.0f - probX) * probY +
                               *(in + rowSizeIn + 1) * probX * probY +
                               0.5f;

            // Write result to output
            *out = static_cast<uint8_t>(mean);
        }
        else
        {
            // Set output to zero if outside valid input zone
            *out = 0;
        }
    }
}