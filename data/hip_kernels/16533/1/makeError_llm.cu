#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void makeError(float *err, float *output, unsigned int Y, const int N)
{
    // Calculate global thread ID
    const int globalId = blockIdx.x * blockDim.x + threadIdx.x;

    // Calculate stride for the grid
    const int stride = blockDim.x * gridDim.x;

    // Loop with stride
    for (int idx = globalId; idx < N; idx += stride) {
        // Compute error with conditional assignment
        err[idx] = ((Y == idx ? 1.0f : 0.0f) - output[idx]);
    }
}