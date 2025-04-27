#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cb_k2()
{
    int gid = blockDim.x * blockIdx.x + threadIdx.x;
    
    // Use a single thread for printing to reduce overhead
    if (gid < 1)
    {
        printf("This is a test 2 \n");
    }
}