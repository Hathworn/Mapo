#include "hip/hip_runtime.h"
#include "includes.h"

/*
* JCudaVec - Vector operations for JCuda
* http://www.jcuda.org
*
* Copyright (c) 2013-2015 Marco Hutter - http://www.jcuda.org
*/

extern "C"

//=== Vector arithmetic ======================================================

extern "C"

//=== Vector-and-scalar arithmetic ===========================================

extern "C"

//=== Vector comparison ======================================================

extern "C"

//=== Vector-and-scalar comparison ===========================================

extern "C"

//=== Vector math (one argument) =============================================

extern "C"

//=== Vector math (two arguments) ============================================

extern "C"

__global__ void vec_mulf (size_t n, float *result, float  *x, float  *y)
{
    // Calculate global thread ID
    int id = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure we have a complete warp to optimize memory access
    if (id < n)
    {
        result[id] = x[id] * y[id];
    }
}