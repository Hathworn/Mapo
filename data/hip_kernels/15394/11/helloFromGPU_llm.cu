#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void helloFromGPU()
{
    // Use thread and block indexing for parallel execution across threads
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    if (idx == 0) // Only a single thread needs to print
    {
        printf("Hello World from GPU!\n");
    }
}