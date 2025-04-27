#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void helloGPU()
{
    // Use warp synchronous printf for optimization
    int tid = threadIdx.x + blockIdx.x * blockDim.x;
    if (tid == 0) // Limit printing to the first thread
    {
        printf("Hello from the GPU.\n");
    }
}