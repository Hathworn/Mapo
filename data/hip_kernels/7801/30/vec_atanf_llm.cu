#include "hip/hip_runtime.h"
#include "includes.h"

/* 
* JCudaVec - Vector operations for JCuda
* http://www.jcuda.org
* 
* Copyright (c) 2013-2015 Marco Hutter - http://www.jcuda.org
*/

// Kernel function to calculate the arc tangent of each element in the array
__global__ void vec_atanf(size_t n, float *result, float *x) 
{
    int id = threadIdx.x + blockIdx.x * blockDim.x;

    // Check if thread ID is within range of input array size
    if (id < n)
    {
        result[id] = atanf(x[id]); // Calculate arc tangent
    }
}