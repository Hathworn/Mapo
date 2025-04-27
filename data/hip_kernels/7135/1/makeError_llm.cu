#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void makeError(float *err, float *output, unsigned int Y, const int N)
{
    // Compute global thread index
    const int idx = blockIdx.x * blockDim.x + threadIdx.x;
    // Use consistent naming for total threads
    const int totalThreads = blockDim.x * gridDim.x;

    // Calculate stride for each thread and perform loop with stride
    for (int i = idx; i < N; i += totalThreads) {
        err[i] = ((Y == i ? 1.0f : 0.0f) - output[i]);
    }
}