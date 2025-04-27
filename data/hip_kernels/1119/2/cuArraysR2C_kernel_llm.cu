#include "hip/hip_runtime.h"
#include "includes.h"
/*
* cuArraysPadding.cu
* Padding Utilities for oversampling
*/

// Padding zeros in the middle, move quads to corners
// for raw chunk data oversampling

__global__ void cuArraysR2C_kernel(float *image1, float2 *image2, int size)
{
    // Optimize access by calculating block index only once
    int idx =  blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure valid thread index before performing the operation
    if (idx < size)
    {
        float2 temp;
        temp.x = image1[idx];
        temp.y = 0.0f;
        image2[idx] = temp;  // Reduce memory access by writing results in one step
    }
}