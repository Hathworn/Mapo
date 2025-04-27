#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void dense_add_conv(size_t sz, float_t* src, float_t* dest, size_t bias_dim)
{
    size_t index = blockIdx.x * blockDim.x + threadIdx.x;

    // Use index modulo bias_dim directly in array access, 
    // to simplify and improve memory access pattern
    if (index < sz)
    {
        dest[index] += src[index % bias_dim];
    }
}