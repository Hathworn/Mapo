#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cudaSSoftplus_backPropagate_kernel(float* x, float* dx, unsigned int size)
{
    const unsigned int index = blockIdx.x * blockDim.x + threadIdx.x;

    if (index < size) {  // Optimize by checking index boundary
        dx[index] *= (1.0f - expf(-x[index]));  // Use expf for better performance with floats
    }
}