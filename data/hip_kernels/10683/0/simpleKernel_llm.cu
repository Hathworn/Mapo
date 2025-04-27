#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void simpleKernel(float *dst, const float *src1, const float *src2)
{
    const int idx = blockIdx.x * blockDim.x + threadIdx.x;
    // Perform the addition only if idx is within bounds for better safety
    if (idx < gridDim.x * blockDim.x) {
        dst[idx] = src1[idx] + src2[idx];
    }
}