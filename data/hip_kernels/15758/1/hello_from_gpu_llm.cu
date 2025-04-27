#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void hello_from_gpu()
{
    // Calculate unique thread index for better performance understanding
    const int tid = blockIdx.x * blockDim.x + threadIdx.x;
    printf("Hello World from global index %d!\n", tid);
}