#include "hip/hip_runtime.h"
#include "includes.h"
/*
* JCudaVec - Vector operations for JCuda
* http://www.jcuda.org
*
* Copyright (c) 2013-2015 Marco Hutter - http://www.jcuda.org
*/

// Optimize memory access by using shared memory
__global__ void vec_sqrtf(size_t n, float *result, float *x)
{
    // Calculate global index
    int id = threadIdx.x + blockIdx.x * blockDim.x;
    
    // Load input into shared memory for coalesced access
    __shared__ float shared_x[256]; // Adjust size according to blockDim.x
    if (threadIdx.x < n - blockIdx.x * blockDim.x) {
        shared_x[threadIdx.x] = x[id];
        __syncthreads(); // Ensure all threads have loaded their data
    }
    
    // Perform square root calculation
    if (id < n) {
        result[id] = sqrtf(shared_x[threadIdx.x]);
    }
}