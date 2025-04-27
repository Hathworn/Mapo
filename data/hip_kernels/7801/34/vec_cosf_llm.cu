#include "hip/hip_runtime.h"
#include "includes.h"

/*
* JCudaVec - Vector operations for JCuda
* http://www.jcuda.org
*
* Copyright (c) 2013-2015 Marco Hutter - http://www.jcuda.org
*/

extern "C"


// Calculate the cosine of the input argument.
extern "C"

__global__ void vec_cosf(size_t n, float *result, float *x)
{
    // Calculate global thread ID
    int id = threadIdx.x + blockIdx.x * blockDim.x;

    // Vectorize loads for better memory access pattern
    int stride = blockDim.x * gridDim.x;
    for (int i = id; i < n; i += stride)
    {
        // Calculate cosine
        result[i] = cosf(x[i]);
    }
}