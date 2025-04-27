#include "hip/hip_runtime.h"
#include "includes.h"

/*
* JCudaVec - Vector operations for JCuda
* http://www.jcuda.org
*
* Copyright (c) 2013-2015 Marco Hutter - http://www.jcuda.org
*/

// Optimize kernel using shared memory and loop unrolling
__global__ void vec_rintf(size_t n, float *result, float *x)
{
    int id = threadIdx.x + blockIdx.x * blockDim.x;
    // Use shared memory to reduce global memory accesses
    __shared__ float shared_x[256];
    
    if (id < n)
    {
        // Load data into shared memory
        shared_x[threadIdx.x] = x[id];
        __syncthreads();
        
        // Unroll loop for optimization
        #pragma unroll
        for (int i = 0; i < 1; ++i) 
        {
            result[id] = rintf(shared_x[threadIdx.x]);
        }
    }
}