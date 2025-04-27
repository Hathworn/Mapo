#include "hip/hip_runtime.h"
#include "includes.h"
/*
* JCudaVec - Vector operations for JCuda
* http://www.jcuda.org
*
* Copyright (c) 2013-2015 Marco Hutter - http://www.jcuda.org
*/


//=== Vector math (one argument) =============================================

// Calculate the inverse complementary error function of the input argument.
extern "C"

__global__ void vec_erfcinvf(size_t n, float *result, float *y)
{
    // Calculate flattened global thread index
    int id = blockIdx.x * blockDim.x + threadIdx.x;

    // Use bounds checking to prevent out-of-range memory access
    if (id < n)
    {
        // Compute the inverse complementary error function
        result[id] = erfcinvf(y[id]);
    }
}