#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void set_zero_kernel(float *src, int size)
{
    // Use a stride loop to allow for fewer blocks
    for (int i = blockIdx.x * blockDim.x + threadIdx.x; i < size; i += blockDim.x * gridDim.x) {
        src[i] = 0;
    }
}