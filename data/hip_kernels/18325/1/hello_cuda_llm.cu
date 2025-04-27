#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void hello_cuda()
{
    // Check if thread is the first thread in the first block
    if (threadIdx.x == 0 && blockIdx.x == 0)
    {
        // Print message from one thread only to reduce overhead
        printf("Hello Cuda world\n");
    }
}