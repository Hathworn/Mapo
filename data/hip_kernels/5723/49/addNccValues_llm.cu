#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized global kernel function
__global__ void addNccValues(const float* __restrict__ prevData, float* __restrict__ result, int slices)
{
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    if (tid < slices)
    {
        float val1 = prevData[3 * tid + 1];
        float val2 = prevData[3 * tid + 2];
        
        // Precompute multiplications and square root for better performance
        float norm = val1 * val2;
        if (norm > 0)
        {
            float res = prevData[3 * tid] * rsqrtf(norm); // Using reciprocal square root for optimization
            atomicAdd(&result[tid], res); // Use atomic operation to avoid potential race conditions
        }
    }
}