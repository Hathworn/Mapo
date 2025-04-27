#include "hip/hip_runtime.h"
#include "includes.h"

// Kernel function with thread and block index
__global__ void hello()
{
    // Improved inline printf statement
    printf("Hello world! I'm a thread in block %d and thread %d\n", blockIdx.x, threadIdx.x);
}