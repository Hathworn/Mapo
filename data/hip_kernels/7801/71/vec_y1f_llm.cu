#include "hip/hip_runtime.h"
#include "includes.h"
/*
* JCudaVec - Vector operations for JCuda
* http://www.jcuda.org
*
* Copyright (c) 2013-2015 Marco Hutter - http://www.jcuda.org
*/

// Kernel to calculate the Bessel function of the second kind for given input `x` and store in `result`
__global__ void vec_y1f(size_t n, float *result, float *x)
{
    // Calculate unique thread ID
    int id = threadIdx.x + blockIdx.x * blockDim.x;

    // Process only valid indices
    if (id < n)
    {
        // Compute Bessel function for the current input
        result[id] = y1f(x[id]);
    }
}