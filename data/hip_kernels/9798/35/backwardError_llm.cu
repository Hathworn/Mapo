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

// Optimize backwardError kernel function
__global__ void backwardError(int n, double *actual, double *target, double* out)
{
    // Calculate index using block and thread indices
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Use shared memory for faster access
    __shared__ double shared_actual[256]; 
    __shared__ double shared_target[256];

    if (i < n) {
        // Load data into shared memory
        shared_actual[threadIdx.x] = actual[i];
        shared_target[threadIdx.x] = target[i];
        __syncthreads(); // Synchronize threads

        // Perform computation
        out[i] += (shared_actual[threadIdx.x] - shared_target[threadIdx.x]);
    }
}