#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void copyRow(float *out, float *in, const int nx, const int ny)
{
    // Calculate single index for multidimensional array
    unsigned int idx = blockIdx.y * blockDim.y * nx + threadIdx.y * nx + blockIdx.x * blockDim.x + threadIdx.x;

    // Use a single index and boundary check once
    if (idx < nx * ny)
    {
        out[idx] = in[idx];
    }
}