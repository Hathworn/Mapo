#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void fill(int *v, std::size_t size)
{
    // Calculate the global thread ID
    auto tid = blockIdx.x * blockDim.x + threadIdx.x;

    // Bounds check to prevent out-of-bounds access
    if (tid < size) {
        v[tid] = tid;
    }
}