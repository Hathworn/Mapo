#include "hip/hip_runtime.h"
#include "includes.h"
/*
* JCudaVec - Vector operations for JCuda
* http://www.jcuda.org
*
* Copyright (c) 2013-2015 Marco Hutter - http://www.jcuda.org
*/

#define BLOCK_SIZE 256  // Defining block size for optimal performance

extern "C"

__global__ void vec_exp10f(size_t n, float *result, float *x)
{
    int id = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = blockDim.x * gridDim.x;
    
    for (int i = id; i < n; i += stride) {  // Process using grid stride loop
        result[i] = exp10f(x[i]);
    }
}