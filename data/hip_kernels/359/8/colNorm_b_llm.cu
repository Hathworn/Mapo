#include "hip/hip_runtime.h"
#include "includes.h"
/***********************************************************
By Huahua Wang, the University of Minnesota, twin cities
***********************************************************/

__global__ void colNorm_b(float* X, float* v, float* b, unsigned int size, unsigned int n)
{
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    const unsigned int stride = blockDim.x * gridDim.x;
    
    // Cache v and b in shared memory for faster access
    __shared__ float v_shared[256]; // Assuming n <= 256
    __shared__ float b_shared[256];

    if (threadIdx.x < n) {
        v_shared[threadIdx.x] = v[threadIdx.x];
        b_shared[threadIdx.x] = b[threadIdx.x];
    }
    __syncthreads();

    for (unsigned long int i = idx; i < size; i += stride) {
        unsigned int col = i % n;
        X[i] /= v_shared[col] * b_shared[col]; // Use cached values
    }
}