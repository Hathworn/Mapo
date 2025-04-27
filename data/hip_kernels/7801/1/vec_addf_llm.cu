#include "hip/hip_runtime.h"
#include "includes.h"
/*
* JCudaVec - Vector operations for JCuda
* http://www.jcuda.org
*
* Copyright (c) 2013-2015 Marco Hutter - http://www.jcuda.org
*/

extern "C"


// Optimized kernel function for vector addition
__global__ void vec_addf (size_t n, float *result, float  *x, float  *y)
{
    // Optimize memory access patterns
    int id = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = gridDim.x * blockDim.x;
    for (int i = id; i < n; i += stride)
    {
        result[i] = x[i] + y[i];
    }
}