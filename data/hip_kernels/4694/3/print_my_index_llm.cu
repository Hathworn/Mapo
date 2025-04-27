#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void print_my_index()
{
    // Calculate global thread index for better understanding and usage
    int globalId = blockIdx.x * blockDim.x + threadIdx.x;
    printf("Global ID: %d, Thread ID: %d, Block ID: %d\n", globalId, threadIdx.x, blockIdx.x);
}