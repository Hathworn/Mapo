```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void hello_from_gpu()
{
    // Use threadIdx and blockIdx to ensure each message is unique
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    printf("Hello World from the GPU! Thread ID: %d\n", idx);
}