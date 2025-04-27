#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void hello_from_gpu()
{
    // Use block and thread indices for distinguishing output in a real use-case
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    printf("Hello World from the GPU! Thread ID: %d\n", idx);
}