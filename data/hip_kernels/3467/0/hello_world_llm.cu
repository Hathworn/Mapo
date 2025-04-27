#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void hello_world()
{
    // Use "blockIdx.x" and "blockDim.x" for a unique global thread ID
    int global_id = blockIdx.x * blockDim.x + threadIdx.x;

    // Efficiently print message using unique global thread ID
    printf("Hello World from Global Thread %d !\n", global_id);
}