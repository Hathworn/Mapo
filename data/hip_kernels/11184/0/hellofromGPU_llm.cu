#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized kernel function
__global__ void hellofromGPU(void)
{
    // Each thread prints a message, optimize by using only one thread
    if (threadIdx.x == 0 && blockIdx.x == 0)
    {
        printf("hello world  \n");
    }
}