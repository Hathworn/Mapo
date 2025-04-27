#include "hip/hip_runtime.h"
#include "includes.h"
/*
* JCudaVec - Vector operations for JCuda
* http://www.jcuda.org
*
* Copyright (c) 2013-2015 Marco Hutter - http://www.jcuda.org
*/

//=== Vector comparison ======================================================

// Kernel function optimized for better performance
__global__ void vec_gtf(size_t n, float *result, float *x, float *y)
{
    int id = blockDim.x * blockIdx.x + threadIdx.x;

    // Use shared memory for block-wide computation caching
    __shared__ float shared_x[256];
    __shared__ float shared_y[256];

    if (id < n) {
        // Load data into shared memory
        shared_x[threadIdx.x] = x[id];
        shared_y[threadIdx.x] = y[id];
    }
    __syncthreads();

    if (id < n) {
        // Perform computation using shared memory
        result[id] = (shared_x[threadIdx.x] > shared_y[threadIdx.x]) ? 1.0f : 0.0f;
    }
}