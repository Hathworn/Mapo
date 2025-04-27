#include "hip/hip_runtime.h"
#include "includes.h"
/*
* JCudaVec - Vector operations for JCuda
* http://www.jcuda.org
*
* Copyright (c) 2013-2015 Marco Hutter - http://www.jcuda.org
*/

extern "C"


__global__ void vec_eqScalarf (size_t n, float *result, float *x, float y)
{
    int id = threadIdx.x + blockIdx.x * blockDim.x;
    
    // Unroll loop for efficiency
    int stride = blockDim.x * gridDim.x;
    for (int i = id; i < n; i += stride)
    {
        result[i] = (x[i] == y) ? 1.0f : 0.0f;
    }
}