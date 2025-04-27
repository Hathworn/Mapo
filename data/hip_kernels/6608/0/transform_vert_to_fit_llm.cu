#include "hip/hip_runtime.h"
#include "includes.h"

__global__ static void transform_vert_to_fit(const int* __restrict__ src, int* __restrict__ dst, const int nb_vert)
{
    // Calculate the global index
    const int p = blockIdx.x * blockDim.x + threadIdx.x;

    // Efficient warp-level handling of elements
    if(p < nb_vert)
    {
        int src_value = src[p];
        dst[p] = (src_value >> 31) + 1; // Use bitwise operation for conversion
    }
}