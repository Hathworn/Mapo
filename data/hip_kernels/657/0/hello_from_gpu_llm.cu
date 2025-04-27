#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void hello_from_gpu(void)
{
    // Use threadIdx.x or blockIdx.x for more dynamic message printing
    const int idx = threadIdx.x + blockIdx.x * blockDim.x;
    if (idx == 0) 
    {
        // Print message from only one thread to avoid redundant output
        printf("Hello World from the GPU!\n");
    }
}