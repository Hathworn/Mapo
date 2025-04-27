#include "hip/hip_runtime.h"
#include "includes.h"

/*
* JCudaVec - Vector operations for JCuda
* http://www.jcuda.org
*
* Copyright (c) 2013-2015 Marco Hutter - http://www.jcuda.org
*/

// Kernel function to compute the normcdff of a vector
__global__ void vec_normcdff (size_t n, float *result, float *y)
{
    int id = threadIdx.x + blockIdx.x * blockDim.x;

    // Ensure valid thread processing
    if (id < n)
    {
        result[id] = normcdff(y[id]); // Calculate normcdff
    }
}