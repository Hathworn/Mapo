#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void set_array_double(double *a, double value, size_t len)
{
    // Use strided loop for memory coalescing and better performance
    size_t idx = blockIdx.x * blockDim.x + threadIdx.x;
    size_t stride = blockDim.x * gridDim.x;
    for (size_t i = idx; i < len; i += stride) {
        a[i] = value;
    }
}