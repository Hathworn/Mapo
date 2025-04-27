#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void hello_from_gpu(void)
{
    int global_tid = blockIdx.x * blockDim.x + threadIdx.x;  // Calculate global thread ID
    printf("Hello World from block %d and thread %d!\n", blockIdx.x, global_tid);  // Use global thread ID
}