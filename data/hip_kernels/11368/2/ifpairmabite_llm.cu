#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void ifpairmabite(int *v, std::size_t size)
{
    // Calculate global thread ID
    auto tid = blockIdx.x * blockDim.x + threadIdx.x;

    // Check if within bounds
    if (tid < size) {
        // Check for even number and update value
        int val = v[tid];
        if ((val & 1) == 0) { // Use bitwise operation for even check
            v[tid] = val * 2;
        }
    }
}