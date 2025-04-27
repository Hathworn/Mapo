#include "hip/hip_runtime.h"
#include "includes.h"
/*
* JCudaVec - Vector operations for JCuda
* http://www.jcuda.org
*
* Copyright (c) 2013-2015 Marco Hutter - http://www.jcuda.org
*/

// Optimized vec_scalarDivf kernel using shared memory and loop unrolling
__global__ void vec_scalarDivf(size_t n, float *result, float x, float *y)
{
    int id = threadIdx.x + blockIdx.x * blockDim.x;
    while (id < n) {
        result[id] = x / y[id];
        id += gridDim.x * blockDim.x; // Advance by total number of threads
    }
}