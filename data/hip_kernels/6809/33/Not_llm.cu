#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void Not(bool* x, size_t idx, size_t N)
{
    // Calculate the index this thread will operate on
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Increase stride to cover all elements
    int stride = blockDim.x * gridDim.x;
    
    // Loop with stride to operate on all necessary elements
    for (; i < N; i += stride)
    {
        // Toggle the boolean value at the current index
        x[(idx - 1) * N + i] = !x[(idx - 1) * N + i];
    }
}