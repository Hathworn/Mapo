#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void hello()
{
    // Use block and thread indices to provide unique identification for each thread
    printf("Hello world! I'm a thread %d in block %d\n", threadIdx.x, blockIdx.x);
}