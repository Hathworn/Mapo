#include "hip/hip_runtime.h"
#include "includes.h"
/*
* JCudaVec - Vector operations for JCuda
* http://www.jcuda.org
*
* Copyright (c) 2013-2015 Marco Hutter - http://www.jcuda.org
*/

// Optimize memory access and reduce divergence
__global__ void vec_nef (size_t n, float *result, float  *x, float  *y)
{
    int id = threadIdx.x + blockIdx.x * blockDim.x;
    if (id < n)
    {
        float xi = x[id];
        float yi = y[id];
        result[id] = (xi != yi) ? 1.0f : 0.0f;
    }
}