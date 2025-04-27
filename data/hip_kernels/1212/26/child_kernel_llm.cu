#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void child_kernel(int *data, int seed)
{
    // Calculate global thread index
    int idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure idx doesn't exceed bounds (additional logic can be added if bounds are known)
    if (idx < <MAX_SIZE>) { // Replace <MAX_SIZE> with actual buffer size if known
        atomicAdd(&data[idx], seed);
    }
}