#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void clean(unsigned int * e, int n)
{
    // Use blockIdx and blockDim to handle larger arrays
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    if (idx < n) {
        e[idx] = 0; // Avoid modulo by using calculated index
    }
}