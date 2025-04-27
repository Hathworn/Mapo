#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void AddTo32(int *sum, int *out, const int *pIn)
{
    // Optimize for parallel execution
    const int idx = blockIdx.x * blockDim.x + threadIdx.x;
    atomicAdd(&out[idx], *pIn);
}