#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized Hello World kernel
__global__ void hello()
{
    // Calculate unique global thread index
    int idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Use the global thread index in printf for better clarity
    printf("Hello world! I'm thread %d in block %d\n", idx, blockIdx.x);
}