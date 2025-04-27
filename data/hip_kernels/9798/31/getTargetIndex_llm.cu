#include "hip/hip_runtime.h"
#include "includes.h"

/*
* JCuda - Java bindings for NVIDIA CUDA driver and runtime API
* http://www.jcuda.org
*
* This code is based on the NVIDIA 'reduction' CUDA sample,
* Copyright 1993-2010 NVIDIA Corporation.
*/

extern "C"

__global__ void getTargetIndex(int n, int *index, double *w)
{
    // Use shared memory for index to reduce global memory access
    __shared__ int sharedIndex;

    int i = blockIdx.x * blockDim.x + threadIdx.x;

    if (i < n)
    {
        if (w[i] == 1.0) 
        {
            sharedIndex = i;
        }
    }

    __syncthreads();

    // Use atomic operation to safely update index in global memory
    if (threadIdx.x == 0 && sharedIndex != -1)
    {
        atomicExch(&index[0], sharedIndex);
    }
}