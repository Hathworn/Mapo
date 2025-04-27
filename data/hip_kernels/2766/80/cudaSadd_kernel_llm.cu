#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cudaSadd_kernel(unsigned int size, float value, const float *x, float *y)
{
    const unsigned int index = blockIdx.x * blockDim.x + threadIdx.x;

    // Optimize by checking bounds before accessing memory
    if (index < size) {
        y[index] = x[index] + value;
    }
}