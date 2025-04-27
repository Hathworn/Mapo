#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void warmup(float *out, float *in, const int nx, const int ny)
{
    // Calculate unique index using grid stride loop
    unsigned int ix = blockIdx.x * blockDim.x + threadIdx.x;
    unsigned int iy = blockIdx.y * blockDim.y + threadIdx.y;

    // Combine index to directly access the array element
    unsigned int idx = iy * nx + ix;

    // Access and assign when indices are within bounds, using grid stride loop
    for (unsigned int i = idx; i < nx * ny; i += blockDim.x * gridDim.x)
    {
        out[i] = in[i];
    }
}