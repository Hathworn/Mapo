#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void concat_z(size_t sz, float_t* src, float_t* dest, float_t* z, size_t stride)
{
    size_t index = blockDim.x * blockIdx.x + threadIdx.x;

    // Use one conditional statement to improve readability and reduce branching
    if (index < sz)
    {
        dest[index] = (index >= stride) ? src[index - stride] : z[index];
    }
}