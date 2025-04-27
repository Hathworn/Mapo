#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void hello()
{
    // Using 'blockIdx.x * blockDim.x + threadIdx.x' for unique thread identification
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    printf("Hello world! I'm thread %d\n", idx);
}