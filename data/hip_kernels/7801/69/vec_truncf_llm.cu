#include "hip/hip_runtime.h"
#include "includes.h"
/*
* JCudaVec - Vector operations for JCuda
* http://www.jcuda.org
*
* Copyright (c) 2013-2015 Marco Hutter - http://www.jcuda.org
*/

// Kernel optimized for coalesced memory access
__global__ void vec_truncf(size_t n, float *result, float *x)
{
    int id = blockIdx.x * blockDim.x + threadIdx.x;

    // Use stride loop for better utilization
    for (int i = id; i < n; i += blockDim.x * gridDim.x) 
    {
        result[i] = truncf(x[i]);
    }
}