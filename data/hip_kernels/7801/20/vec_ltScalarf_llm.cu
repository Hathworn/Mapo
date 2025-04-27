#include "hip/hip_runtime.h"
#include "includes.h"
/*
* JCudaVec - Vector operations for JCuda
* http://www.jcuda.org
*
* Copyright (c) 2013-2015 Marco Hutter - http://www.jcuda.org
*/

// Optimized kernel to check if elements in vector x are less than scalar y
__global__ void vec_ltScalarf(size_t n, float *result, float *x, float y)
{
    // Calculate the global thread index
    int id = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Check boundary condition and perform the operation
    if (id < n)
    {
        result[id] = (x[id] < y) ? 1.0f : 0.0f;
    }
}