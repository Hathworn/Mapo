#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void copy_kernel(size_t sz, float_t* src, float_t* dest)
{
    // Calculate the global index
    size_t index = blockIdx.x * blockDim.x + threadIdx.x;
    // Ensure multiple elements processed per thread where possible
    size_t stride = gridDim.x * blockDim.x;

    // Use stride loop to allow for coalesced memory access and better utilization
    for (size_t i = index; i < sz; i += stride)
    {
        dest[i] = src[i];
    }
}