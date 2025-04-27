#include "hip/hip_runtime.h"
#include "includes.h"

/*
* JCudaVec - Vector operations for JCuda
* http://www.jcuda.org
*
* Copyright (c) 2013-2015 Marco Hutter - http://www.jcuda.org
*/

// Optimize vec_lteScalarf kernel function
__global__ void vec_lteScalarf (size_t n, float *result, float *x, float y)
{
    int id = threadIdx.x + blockIdx.x * blockDim.x;

    // Use conditional assignment directly without branch
    if (id < n)
    {
        result[id] = static_cast<float>(x[id] <= y);
    }
}