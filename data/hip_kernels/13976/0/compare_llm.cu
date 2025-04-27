#include "hip/hip_runtime.h"
#include "includes.h"

#define SIZE 16

__global__ void compare(int *in_d, int* out_d)
{
    // Use thread ID to remove conditional branching and increase parallelism
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    
    if (idx < SIZE) // Add boundary check to prevent out-of-bounds access
    {
        out_d[idx] = (in_d[idx] == 6) ? 1 : 0;
    }
}