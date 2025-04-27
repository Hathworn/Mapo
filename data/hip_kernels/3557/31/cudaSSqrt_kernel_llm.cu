#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cudaSSqrt_kernel(unsigned int size, float* data)
{
    const unsigned int index = blockIdx.x * blockDim.x + threadIdx.x;
    const unsigned int stride = blockDim.x * gridDim.x;

    if (index < size)  // Ensure valid index before processing
    {
        data[index] = sqrt(data[index]);
        for (unsigned int i = index + stride; i < size; i += stride)
        {
            data[i] = sqrt(data[i]);  // Process remaining elements within bounds
        }
    }
}