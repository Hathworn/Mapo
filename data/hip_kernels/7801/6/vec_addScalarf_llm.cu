#include "hip/hip_runtime.h"
#include "includes.h"
/*
* JCudaVec - Vector operations for JCuda
* http://www.jcuda.org
*
* Copyright (c) 2013-2015 Marco Hutter - http://www.jcuda.org
*/

// Optimized kernel using grid-stride loop for improved parallelism
__global__ void vec_addScalarf(size_t n, float *result, float *x, float y)
{
    int id = threadIdx.x + blockIdx.x * blockDim.x;
    int stride = blockDim.x * gridDim.x;
    while (id < n)
    {
        result[id] = x[id] + y;
        id += stride;
    }
}