#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void divide_copy(double *dest, const double *src, int length, const double divisor)
{
    // Calculate 1.0 / divisor once per block
    __shared__ double factor;
    if (threadIdx.x == 0) {
        factor = 1.0 / divisor;
    }
    __syncthreads(); // Ensure factor is loaded before any thread uses it

    // Calculate global thread index
    int tid = threadIdx.x + blockIdx.x * blockDim.x;
    // Loop through data array to handle larger arrays efficiently
    for (int index = tid; index < length; index += blockDim.x * gridDim.x) {
        dest[index] = src[index] * factor;
    }
}