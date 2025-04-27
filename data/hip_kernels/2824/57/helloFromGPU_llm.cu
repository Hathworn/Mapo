#include "hip/hip_runtime.h"
#include "includes.h"

// kernel function optimized by using a conditional check to print only from one thread
__global__ void helloFromGPU()
{
    if (threadIdx.x == 0 && blockIdx.x == 0) // Print once from the first thread in the first block
    {
        printf("Hello World from GPU!\n");
    }
}