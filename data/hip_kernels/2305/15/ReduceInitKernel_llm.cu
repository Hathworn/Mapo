#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void ReduceInitKernel(float *dst, int length)
{
    int x = blockIdx.x * blockDim.x + threadIdx.x;

    // Use grid-stride loop for better GPU utilization and handle all elements
    for (int idx = x; idx < length; idx += blockDim.x * gridDim.x) {
        dst[idx] = 0.0f;
    }
}