#include "hip/hip_runtime.h"
#include "includes.h"

/*
* JCudaVec - Vector operations for JCuda
* http://www.jcuda.org
*
* Copyright (c) 2013-2015 Marco Hutter - http://www.jcuda.org
*/

extern "C"

// Optimized kernel for computing the inverse error function
__global__ void vec_erfinvf(size_t n, float *result, float *y)
{
    int id = threadIdx.x + blockIdx.x * blockDim.x;
    if (id < n)
    {
        // Utilize registers efficiently for computation
        float value = y[id];
        result[id] = erfinvf(value);
    }
}
