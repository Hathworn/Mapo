#include "hip/hip_runtime.h"
#include "includes.h"

// Use constant memory for PI_F
__constant__ float c_PI_F = 3.14159265358979323846;

__global__ void windowHann2d(float* idata, int length, int height)
{
    // Calculate proper indices and stride
    int tidx = blockIdx.x * blockDim.x + threadIdx.x;
    int tidy = blockIdx.y * blockDim.y + threadIdx.y;
    // Ensure valid indices within bounds
    if (tidx < length && tidy < height)
    {
        // Precompute constant terms for efficiency
        float cosTermY = cos(2 * tidy * c_PI_F / (height - 1));
        float cosTermX = cos(2 * tidx * c_PI_F / (length - 1));
        // Use registers for repeated calculations to reduce memory access
        float hannValueY = 0.5f * (1 + cosTermY);
        float hannValueX = 0.5f * (1 + cosTermX);
        // Calculate final Hann window value
        idata[tidy * length + tidx] = hannValueY * hannValueX;
    }
}