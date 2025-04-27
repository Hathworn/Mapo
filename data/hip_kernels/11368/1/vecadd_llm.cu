#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void vecadd(int *v0, int *v1, std::size_t size)
{
    // calculate global thread index
    auto tid = blockIdx.x * blockDim.x + threadIdx.x;

    // ensure thread index is within bounds
    if (tid < size) {
        v0[tid] += v1[tid];
    }
}