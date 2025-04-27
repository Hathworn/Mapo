#include "hip/hip_runtime.h"
#include "includes.h"
/*
* JCudaVec - Vector operations for JCuda
* http://www.jcuda.org
*
* Copyright (c) 2013-2015 Marco Hutter - http://www.jcuda.org
*/

// Optimize kernel using shared memory and loop unrolling to improve performance

__global__ void vec_tgammaf(size_t n, float *result, float *x) 
{
    extern __shared__ float shmem[];
    int idx = threadIdx.x + blockDim.x * blockIdx.x;
    int id = threadIdx.x;

    if (idx < n) {
        // Load data into shared memory for better memory access patterns
        shmem[id] = x[idx];
        __syncthreads();

        // Unroll loop for better instruction throughput
        #pragma unroll
        for (int i = id; i < blockDim.x && idx+i < n; i += blockDim.x) {
            result[idx+i] = tgammaf(shmem[i]);
        }
    }
}