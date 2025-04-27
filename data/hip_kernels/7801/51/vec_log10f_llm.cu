#include "hip/hip_runtime.h"
#include "includes.h"
/*
* JCudaVec - Vector operations for JCuda
* http://www.jcuda.org
*
* Copyright (c) 2013-2015 Marco Hutter - http://www.jcuda.org
*/

// Kernel to calculate the base 10 logarithm for each element in the array.
__global__ void vec_log10f(size_t n, float *result, float *x)
{
    int id = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = gridDim.x * blockDim.x;
    // Use loop unrolling for better performance
    for (int i = id; i < n; i += stride)
    {
        result[i] = log10f(x[i]);
    }
}