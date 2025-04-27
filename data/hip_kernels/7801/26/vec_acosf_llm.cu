#include "hip/hip_runtime.h"
#include "includes.h"

/*
* JCudaVec - Vector operations for JCuda
* http://www.jcuda.org
*
* Copyright (c) 2013-2015 Marco Hutter - http://www.jcuda.org
*/

extern "C"

// Calculate the arc cosine of the input argument.
extern "C"

// Optimize using loop unrolling
__global__ void vec_acosf (size_t n, float *result, float *x)
{
    int id = threadIdx.x + blockIdx.x * blockDim.x;
    
    // Unrolling the loop to improve performance
    int stride = gridDim.x * blockDim.x;
    while (id < n)
    {
        result[id] = acosf(x[id]);
        
        // Process next element in the stride
        if (id + stride < n)
            result[id + stride] = acosf(x[id + stride]);

        // Increment index by stride for next iteration
        id += stride;
    }
}