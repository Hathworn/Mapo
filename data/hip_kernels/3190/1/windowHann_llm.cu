#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void windowHann(float* idata, int length)
{
    // Optimize with precomputed common terms and ensure alignment
    int tidx = threadIdx.x + blockIdx.x * blockDim.x;

    if (tidx < length)
    {
        float factor = 2 * PI_F / (length - 1); // Precompute the constant factor
        idata[tidx] = 0.5 * (1 + cos(tidx * factor)); // Use the precomputed factor
    }
}