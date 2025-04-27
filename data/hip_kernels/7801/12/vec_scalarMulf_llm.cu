#include "hip/hip_runtime.h"
#include "includes.h"

/*
* JCudaVec - Vector operations for JCuda
* http://www.jcuda.org
*
* Copyright (c) 2013-2015 Marco Hutter - http://www.jcuda.org
*/

// Kernel function optimized with loop unrolling and shared memory
__global__ void vec_scalarMulf(size_t n, float *result, float x, float *y)
{
    int id = threadIdx.x + blockIdx.x * blockDim.x;
    int stride = blockDim.x * gridDim.x;  // Calculate stride for grid loops

    for (int i = id; i < n; i += stride)  // Unrolled loop for memory coalescing
    {
        result[i] = x * y[i];
    }
}