#include "hip/hip_runtime.h"
#include "includes.h"
/*
* JCudaVec - Vector operations for JCuda
* http://www.jcuda.org
*
* Copyright (c) 2013-2015 Marco Hutter - http://www.jcuda.org
*/

extern "C"

__global__ void vec_hypotf(size_t n, float *result, float *x, float *y)
{
    int id = blockIdx.x * blockDim.x + threadIdx.x;
    // Use grid-stride loop for better utilization
    for (int i = id; i < n; i += blockDim.x * gridDim.x)
    {
        result[i] = hypotf(x[i], y[i]);
    }
}