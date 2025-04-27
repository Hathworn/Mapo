#include "hip/hip_runtime.h"
#include "includes.h"
/*
* JCudaVec - Vector operations for JCuda
* http://www.jcuda.org
*
* Copyright (c) 2013-2015 Marco Hutter - http://www.jcuda.org
*/

// Kernel for performing ceiling operation on each element of a vector
__global__ void vec_ceilf(size_t n, float *result, float *x)
{
    // Obtain global thread index
    int id = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Ensure the current thread works on a valid element
    if (id < n)
    {
        // Perform ceiling operation
        result[id] = ceilf(x[id]);
    }
}