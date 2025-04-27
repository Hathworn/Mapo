#include "hip/hip_runtime.h"
#include "includes.h"
/*
* JCudaVec - Vector operations for JCuda
* http://www.jcuda.org
*
* Copyright (c) 2013-2015 Marco Hutter - http://www.jcuda.org
*/

// Optimized kernel using shared memory for better memory access patterns
__global__ void vec_normcdfinvf(size_t n, float *result, float *y)
{
    extern __shared__ float shared_y[];
    int id = threadIdx.x + blockIdx.x * blockDim.x;
    int tid = threadIdx.x;

    // Load data into shared memory for faster access
    if (id < n)
    {
        shared_y[tid] = y[id];
        __syncthreads();

        // Calculate only when id corresponds to n and data is loaded
        if (id < n)
        {
            result[id] = normcdfinvf(shared_y[tid]);
        }
    }
}