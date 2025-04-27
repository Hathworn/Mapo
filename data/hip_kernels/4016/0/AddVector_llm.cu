#include "hip/hip_runtime.h"
#include "includes.h"

/* kernel.cu */

__global__ void AddVector(int vecSize, const float* vecA, const float* vecB, float* vecC)
{
    int i = blockDim.x * blockIdx.x + threadIdx.x;

    // Use bound check to exit early if out of range
    if (i >= vecSize) return;

    vecC[i] = vecA[i] + vecB[i];
}