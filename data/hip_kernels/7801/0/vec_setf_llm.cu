#include "hip/hip_runtime.h"
#include "includes.h"
/*
* JCudaVec - Vector operations for JCuda
* http://www.jcuda.org
*
* Copyright (c) 2013-2015 Marco Hutter - http://www.jcuda.org
*/

__global__ void vec_setf(size_t n, float *result, float value)
{
    // Calculate unique thread index
    int id = threadIdx.x + blockIdx.x * blockDim.x;
    
    // Use a loop with stride equal to total number of threads
    for (int i = id; i < n; i += blockDim.x * gridDim.x) 
    {
        result[i] = value;
    }
}