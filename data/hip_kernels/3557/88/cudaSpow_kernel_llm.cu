#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cudaSpow_kernel(unsigned int size, float power, const float *x, float *y)
{
    const unsigned int index = blockIdx.x * blockDim.x + threadIdx.x;
    const unsigned int stride = blockDim.x * gridDim.x;

    // Loop unrolling to enhance performance
    #pragma unroll
    for (unsigned int i = index; i < size; i += stride) {
        y[i] = powf(x[i], power);
    }
}