#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void Sin(float *x, size_t idx, size_t N, float W0)
{
    // Cache computed index calculations for efficiency
    size_t baseIdx = (idx - 1) * N;
    int threadStride = blockDim.x * gridDim.x;
    for (int i = blockIdx.x * blockDim.x + threadIdx.x; i < N; i += threadStride)
    {
        x[baseIdx + i] = sin(W0 * x[baseIdx + i]);
    }
}