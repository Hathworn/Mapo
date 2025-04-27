#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void sum_of_mults_kernel(float *a1, float *a2, float *b1, float *b2, size_t size, float *dst)
{
    const int index = blockIdx.x * blockDim.x + threadIdx.x;
    if (index < size) {
        // Prefetch data to reduce global memory access
        float a1_val = a1[index];
        float a2_val = a2[index];
        float b1_val = b1[index];
        float b2_val = b2[index];
        dst[index] = a1_val * a2_val + b1_val * b2_val;
    }
}