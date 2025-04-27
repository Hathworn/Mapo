#include "hip/hip_runtime.h"
#include "includes.h"
/*
* cuArraysPadding.cu
* Padding Utilities for oversampling
*/

// Padding zeros in the middle, move quads to corners
// For raw chunk data oversampling
// Tested
__global__ void cuArraysC2R_kernel(float2 *image1, float *image2, int size)
{
    int idx = threadIdx.x + blockDim.x * blockIdx.x;

    // Use shared memory for optimized memory access
    __shared__ float2 sharedImage1[1024];

    if (idx < size)
    {
        // Load data from global to shared memory
        sharedImage1[threadIdx.x] = image1[idx];
        __syncthreads();

        // Store result from shared memory to global memory
        image2[idx] = sharedImage1[threadIdx.x].x;
    }
}