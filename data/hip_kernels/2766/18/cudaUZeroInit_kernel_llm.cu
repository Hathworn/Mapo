#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void cudaUZeroInit_kernel(unsigned int size, unsigned int* data)
{
    const unsigned int index = blockIdx.x * blockDim.x + threadIdx.x;
    const unsigned int stride = blockDim.x * gridDim.x;

    // Unroll the loop to increase throughput and reduce loop overhead
    for (unsigned int i = index; i < size; i += stride * 4) {
        data[i] = 0U;
        if (i + stride < size) data[i + stride] = 0U;
        if (i + 2 * stride < size) data[i + 2 * stride] = 0U;
        if (i + 3 * stride < size) data[i + 3 * stride] = 0U;
    }
}