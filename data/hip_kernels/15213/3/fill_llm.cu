#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void fill(int *v, std::size_t size)
{
    auto tid = blockIdx.x * blockDim.x + threadIdx.x; // Calculate global thread ID
    if (tid < size) // Boundary check
    {
        v[tid] = tid;
    }
}