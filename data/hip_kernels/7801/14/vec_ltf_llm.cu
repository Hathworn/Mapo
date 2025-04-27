#include "hip/hip_runtime.h"
#include "includes.h"
/*
* JCudaVec - Vector operations for JCuda
* http://www.jcuda.org
*
* Copyright (c) 2013-2015 Marco Hutter - http://www.jcuda.org
*/

extern "C"

__global__ void vec_ltf (size_t n, float *result, float  *x, float  *y)
{
    // Calculate the global thread ID
    int id = blockDim.x * blockIdx.x + threadIdx.x;

    // Optimize condition check and ensure all threads are utilized
    if (id < n)
    {
        // Simplify comparison using ternary operator
        result[id] = (x[id] < y[id]) ? 1.0f : 0.0f;
    }
}