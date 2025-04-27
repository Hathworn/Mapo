#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void copyRow(float *out, float *in, const int nx, const int ny)
{
    // Calculate flattened thread index
    unsigned int idx = threadIdx.x + blockIdx.x * blockDim.x + 
                       (threadIdx.y + blockIdx.y * blockDim.y) * nx;

    // Ensure index is within bounds and perform copy
    if (idx < nx * ny)
    {
        out[idx] = in[idx];
    }
}