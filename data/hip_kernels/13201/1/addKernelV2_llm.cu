#include "hip/hip_runtime.h"
#include "includes.h"
#define NOMINMAX

const unsigned int BLOCK_SIZE = 512;

__global__ void addKernelV2(float *c, const float *a, const float *b)
{
    // Calculate the global thread index
    unsigned int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Check bounds to avoid memory access errors
    if (i < BLOCK_SIZE) {
        c[i] = a[i] + b[i];
    }
}