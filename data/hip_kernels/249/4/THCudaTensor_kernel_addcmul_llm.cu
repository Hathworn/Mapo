#include "hip/hip_runtime.h"
#include "includes.h"

// Kernel function with thread index calculation optimization
__global__ void THCudaTensor_kernel_addcmul(float *data, float value, float *src1, float *src2, long size)
{
    long k = blockIdx.x * blockDim.x + threadIdx.x;  // Simplified thread index calculation

    if (k < size)
    {
        data[k] += value * src1[k] * src2[k];
    }
}