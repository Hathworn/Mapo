#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void hello_from_gpu() 
{
    // Cache block and thread indices in registers for faster access
    const int b = blockIdx.x;
    const int tx = threadIdx.x;
    const int ty = threadIdx.y;

    // Use a single printf statement to optimize performance
    printf("Hello World from block-%d and thread-(%d, %d)!\n", b, tx, ty);
}