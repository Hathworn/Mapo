#include "hip/hip_runtime.h"
#include "includes.h"
/*
* JCudaVec - Vector operations for JCuda
* http://www.jcuda.org
*
* Copyright (c) 2013-2015 Marco Hutter - http://www.jcuda.org
*/

// Optimize kernel function for better performance
__global__ void vec_cospif (size_t n, float *result, float *x)
{
    int id = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = blockDim.x * gridDim.x;

    // Ensure to cover all elements with a stride
    for (int i = id; i < n; i += stride) {
        result[i] = cospif(x[i]);
    }
}