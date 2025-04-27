#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void THCudaTensor_kernel_addcdiv(float *data, float value, float *src1, float *src2, long size)
{
    long k = blockIdx.x * blockDim.x + threadIdx.x + blockIdx.y * blockDim.x * gridDim.x;

    // Check bounds and perform operation with minimal branching
    if (k < size)
    {
        float src2_val = src2[k];
        if(src2_val != 0) // Avoid division by zero
        {
            float src1_val = src1[k];
            data[k] += value * src1_val / src2_val;
        }
    }
}