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

__global__ void difference(int n, double *actual, double *target, double* out)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    // Check if the index is within bounds
    if (i < n)
    {
        // Directly write result to output array
        out[i] = actual[i] - target[i];
    }
}