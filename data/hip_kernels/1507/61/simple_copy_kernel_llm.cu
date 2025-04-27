#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void simple_copy_kernel(int size, float *src, float *dst)
{
    // Calculate the global thread index efficiently
    int index = blockIdx.x*blockDim.x + threadIdx.x;

    // Check index and copy element using optimal condition
    if (index < size) {
        // Efficient memory access
        dst[index] = src[index];
    }
}