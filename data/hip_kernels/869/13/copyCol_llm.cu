#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void copyCol(float *out, float *in, const int nx, const int ny)
{
    // Calculate flattened thread index for improved memory access pattern
    unsigned int idx = blockDim.x * blockIdx.x + threadIdx.x;
    unsigned int offset = blockDim.x * gridDim.x;

    // Iterate over columns with stride to ensure all elements are copied
    while (idx < nx * ny)
    {
        out[idx] = in[idx];
        idx += offset; // Move to next column position
    }
}