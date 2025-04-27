#include "hip/hip_runtime.h"
#include "includes.h"
/*
* JCudaVec - Vector operations for JCuda
* http://www.jcuda.org
*
* Copyright (c) 2013-2015 Marco Hutter - http://www.jcuda.org
*/

// Global kernel for element-wise power operation
__global__ void vec_powf(size_t n, float *result, float *x, float *y)
{
    // Use more efficient calculation of thread index
    size_t id = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Check to ensure within bounds
    if (id < n)
    {
        result[id] = powf(x[id], y[id]);
    }
}