#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void copyGlobalCol(float *out, float *in, const int nx, const int ny)
{
    // Calculate flattened index directly for coalesced memory access
    unsigned int idx = threadIdx.x + blockDim.x * blockIdx.x;
    unsigned int idy = threadIdx.y + blockDim.y * blockIdx.y;

    if (idx < nx && idy < ny)
    {
        unsigned int index = idx * ny + idy;
        out[index] = in[index];
    }
}