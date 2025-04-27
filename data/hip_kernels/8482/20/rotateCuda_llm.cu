#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void rotateCuda( const uint8_t * in, uint32_t rowSizeIn, uint8_t * out, uint32_t rowSizeOut, float inXStart, float inYStart, uint32_t width, uint32_t height, float cosAngle, float sinAngle )
{
    // Calculate output image coordinates
    uint32_t outX = blockDim.x * blockIdx.x + threadIdx.x;
    uint32_t outY = blockDim.y * blockIdx.y + threadIdx.y;

    // Only process valid output pixels
    if ( outX < width && outY < height ) {
        // Calculate exact input coordinates by inverse rotation
        const float exactInX = inXStart + cosAngle * outX + sinAngle * outY;
        const float exactInY = inYStart - sinAngle * outX + cosAngle * outY;

        const int32_t inX = static_cast<int32_t>(exactInX);
        const int32_t inY = static_cast<int32_t>(exactInY);

        // Calculate output pixel address
        uint8_t * outPixel = out + outY * rowSizeOut + outX;

        // Boundary check to ensure input pixels are within range
        if ( inX < 0 || inX >= width - 1 || inY < 0 || inY >= height - 1 ) {
            *outPixel = 0; // Set output pixel to 0 for out-of-bounds input
        }
        else {
            // Calculate input pixel address for bilinear interpolation
            const uint8_t * inPixel = in + inY * rowSizeIn + inX;

            // Perform bilinear interpolation
            const float probX = exactInX - inX;
            const float probY = exactInY - inY;
            const float mean = *inPixel * (1 - probX) * (1 - probY) +
                               *(inPixel + 1) * probX * (1 - probY) +
                               *(inPixel + rowSizeIn) * (1 - probX) * probY +
                               *(inPixel + rowSizeIn + 1) * probX * probY +
                               0.5f;

            // Assign computed pixel intensity to output
            *outPixel = static_cast<uint8_t>(mean);
        }
    }
}