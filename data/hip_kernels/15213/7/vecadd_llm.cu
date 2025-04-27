#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void vecadd(int* v0, int* v1, std::size_t size)
{
    auto tid = blockIdx.x * blockDim.x + threadIdx.x; // Use global thread index
    if (tid < size) // Check bounds to avoid out-of-range memory access
    {
        v0[tid] += v1[tid];
    }
}