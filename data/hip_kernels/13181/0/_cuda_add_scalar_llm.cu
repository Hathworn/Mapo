```c
#include "hip/hip_runtime.h"
#include "includes.h"

#define WARP_SIZE 32 // # of threads that are executed together (constant valid on most hardware)

// Optimize kernel to use shared memory and efficient indexing
__global__ void _cuda_add_scalar(int *in, int scalar, int n)
{
    int globalIdx = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = blockDim.x * gridDim.x;

    for (int i = globalIdx; i < n; i += stride) {
        // Adding scalar value to each element of the input array 
        in[i] += scalar;
    }
}