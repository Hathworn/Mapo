#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void calcLoss(float *err, float *output, unsigned int Y, const int N)
{
    // Calculate the global thread index.
    const int idx = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Ensure the index is within the bounds.
    if (idx < N) {
        // Compute the error directly.
        err[idx] = ((Y == idx ? 1.0f : 0.0f) - output[idx]);
    }
}