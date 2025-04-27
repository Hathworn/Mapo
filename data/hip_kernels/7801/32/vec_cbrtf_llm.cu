#include "hip/hip_runtime.h"
#include "includes.h"
/*
* JCudaVec - Vector operations for JCuda
* http://www.jcuda.org
*
* Copyright (c) 2013-2015 Marco Hutter - http://www.jcuda.org
*/

extern "C"

// Optimize global kernel function using appropriate memory and thread strategy

__global__ void vec_cbrtf(size_t n, float *result, float *x)
{
    // Calculate unique thread index
    int id = threadIdx.x + blockIdx.x * blockDim.x;
    
    // Loop optimization for improving memory access
    for (int index = id; index < n; index += gridDim.x * blockDim.x) {
        result[index] = cbrtf(x[index]);
    }
}