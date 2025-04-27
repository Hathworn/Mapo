#include "hip/hip_runtime.h"
#include "includes.h"

// Use shared memory to optimize thread usage
__global__ void helloFromGPU()
{
    // Calculate unique thread index
    int idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Only the first thread in each block will print to reduce overhead
    if (idx == 0)
    {
        printf("Hello World from GPU!\n");
    }
}