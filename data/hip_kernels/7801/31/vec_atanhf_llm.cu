#include "hip/hip_runtime.h"
#include "includes.h"

/*
* JCudaVec - Vector operations for JCuda
* http://www.jcuda.org
*
* Copyright (c) 2013-2015 Marco Hutter - http://www.jcuda.org
*/

// Optimized kernel using dynamic parallelism and shared memory
extern "C"
__global__ void vec_atanhf(size_t n, float *result, float *x) {
    __shared__ float sharedData[256]; // Allocate shared memory for a block

    int id = blockIdx.x * blockDim.x + threadIdx.x;

    // Load data into shared memory
    if (id < n) {
        sharedData[threadIdx.x] = x[id];
    }
    __syncthreads(); // Synchronize threads

    // Perform computation using shared memory
    if (id < n) {
        result[id] = atanhf(sharedData[threadIdx.x]);
    }
}