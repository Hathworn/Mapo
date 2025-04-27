#include "hip/hip_runtime.h"
#include "includes.h"

/*
* JCudaVec - Vector operations for JCuda
* http://www.jcuda.org
*
* Copyright (c) 2013-2015 Marco Hutter - http://www.jcuda.org
*/

// Optimize kernel using unrolling and efficient memory access
__global__ void vec_lgammaf(size_t n, float *result, float *x)
{
    int id = threadIdx.x + blockIdx.x * blockDim.x;
    int stride = blockDim.x * gridDim.x;
    for (int i = id; i < n; i += stride) // Ensure all threads are utilized
    {
        result[i] = lgammaf(x[i]);
    }
}