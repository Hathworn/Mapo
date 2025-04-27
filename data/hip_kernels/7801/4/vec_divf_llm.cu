#include "hip/hip_runtime.h"
#include "includes.h"
/*
* JCudaVec - Vector operations for JCuda
* http://www.jcuda.org
*
* Copyright (c) 2013-2015 Marco Hutter - http://www.jcuda.org
*/

// Optimize vector division kernel using shared memory for coalesced access
__global__ void vec_divf(size_t n, float* result, float* x, float* y)
{
    int id = threadIdx.x + blockIdx.x * blockDim.x;
    // Use shared memory for better memory access pattern
    extern __shared__ float shared[];
    if (id < n)
    {
        shared[threadIdx.x] = y[id];
        __syncthreads(); // Ensure all threads have copied data to shared memory
        result[id] = x[id] / shared[threadIdx.x];
    }
}