#include "hip/hip_runtime.h"
#include "includes.h"

/***********************************************************
By Huahua Wang, the University of Minnesota, twin cities
***********************************************************/

// Optimized global kernel function
__global__ void colNorm(float* X, float* v, unsigned int size, unsigned int n)
{
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    const unsigned int stride = blockDim.x * gridDim.x;

    // Use block-level cache to minimize global memory access for `v`
    __shared__ float v_shared[256]; // Assume a fixed max block size

    for (unsigned long int i = idx; i < size; i += stride) {
        // Load v[col] into shared memory only once
        if (threadIdx.x < n) {
            v_shared[threadIdx.x] = v[threadIdx.x];
        }
        __syncthreads();

        unsigned int col = i % n;
        X[i] /= v_shared[col];

        __syncthreads();
    }
}