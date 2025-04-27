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

// Calculate the arc hyperbolic sine of the input argument.
__global__ void vec_asinhf(size_t n, float *result, float *x)
{
    // Calculate global thread index
    int id = blockIdx.x * blockDim.x + threadIdx.x;

    // Check if index is within bounds
    if (id < n)
    {
        // Compute arc hyperbolic sine for each element
        result[id] = asinhf(x[id]);
    }
}