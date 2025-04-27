#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel()
{
    // Use constants to reduce calculations
    const int tidx = threadIdx.x + blockIdx.x * blockDim.x;
    const int tidy = threadIdx.y + blockIdx.y * blockDim.y;

    // Pre-calculate message size
    const int size = sizeof(int);

    // Print debugging information
    printf("Hello, World! size=%d   tidx=%d, tidy=%d\n", size, tidx, tidy);
}