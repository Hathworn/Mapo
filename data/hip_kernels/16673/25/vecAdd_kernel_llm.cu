#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void vecAdd_kernel(float *c, const float* a, const float* b)
{
    int idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Use shared memory to optimize repeated memory access
    __shared__ float sharedA[500];
    __shared__ float sharedB[500];

    // Load data into shared memory
    if (idx < 500) {
        sharedA[idx] = a[idx];
        sharedB[idx] = b[idx];
    }
    __syncthreads();

    // Perform computation using shared memory
    if (idx < 500) {
        c[idx] = sharedA[idx] + sharedB[idx];
    }
}