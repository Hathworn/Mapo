#include "hip/hip_runtime.h"
#include "includes.h"
/*
* JCuda - Java bindings for NVIDIA CUDA driver and runtime API
* http://www.jcuda.org
*
*
* This code is based on the NVIDIA 'reduction' CUDA sample,
* Copyright 1993-2010 NVIDIA Corporation.
*/

extern "C"

__global__ void mismatch(int n, double* actual, double *target, int *mis)
{
    // Use shared memory to reduce global memory access
    __shared__ int local_mis;
    if (threadIdx.x == 0) local_mis = 0;
    __syncthreads();

    int i = blockIdx.x * blockDim.x + threadIdx.x;
    if (i < n)
    {
        if (target[i] >= 0.5 && actual[i] < 0.5) atomicMax(&local_mis, 1);
        if (target[i] < 0.5 && actual[i] >= 0.5) atomicMax(&local_mis, 1);
    }

    __syncthreads();
    // First thread in the block updates global memory
    if (threadIdx.x == 0 && local_mis == 1) atomicMax(mis, 1);
}