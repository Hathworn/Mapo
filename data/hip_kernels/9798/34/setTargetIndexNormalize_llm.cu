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

__global__ void setTargetIndexNormalize(int n, double sum, double *w, double *out, double* output)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Use shared memory for better memory access efficiency
    __shared__ double out_shared[256];
    
    if (i < n)
    {
        // Load data into shared memory
        out_shared[threadIdx.x] = w[i] == 1.0 ? out[i] : 0.0;
        __syncthreads(); // Synchronize to ensure all threads have loaded their values
        
        // First thread in block computes the result
        if(threadIdx.x == 0) 
        {
            double tempSum = 0.0;
            for(int j = 0; j < blockDim.x; j++)
            {
                if(i + j < n) // Check for boundary within block
                {
                    tempSum += out_shared[j];
                }
            }
            // Update output[0] atomically to avoid race conditions
            atomicAdd(&output[0], tempSum / sum);
        }
    }
}