#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void helloGPU()
{
    // Use thread 0 in block 0 to minimize redundant executions
    if (threadIdx.x == 0 && blockIdx.x == 0) {
        printf("Hello from the GPU.\n");
    }
}