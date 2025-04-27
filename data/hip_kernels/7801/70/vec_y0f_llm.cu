#include "hip/hip_runtime.h"
#include "includes.h"
/*
* JCudaVec - Vector operations for JCuda
* http://www.jcuda.org
*
* Copyright (c) 2013-2015 Marco Hutter - http://www.jcuda.org
*/

// Optimize kernel by reducing register pressure and using efficient indexing
__global__ void vec_y0f (size_t n, float *result, float *x)
{
    int id = blockIdx.x * blockDim.x + threadIdx.x;
    if (id < n)
    {
        float xi = x[id]; // Load input into a register
        result[id] = y0f(xi); // Use register variable
    }
}