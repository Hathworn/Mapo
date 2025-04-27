#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void THCudaTensor_kernel_addcdiv(float *data, float value, float *src1, float *src2, long size)
{
    // Calculate the global thread index
    long idx = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Process each element in a strided manner to improve memory coalescing
    for (long k = idx; k < size; k += blockDim.x * gridDim.x) {
        data[k] += value * src1[k] / src2[k];
    }
}