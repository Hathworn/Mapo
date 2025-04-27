#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void set_zero_kernel(float *src, int size)
{
    // Calculate grid stride to iterate over elements in a coalesced manner
    int stride = blockDim.x * gridDim.x;
    for (int i = blockIdx.x * blockDim.x + threadIdx.x; i < size; i += stride)
    {
        src[i] = 0;
    }
}