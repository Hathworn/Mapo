#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void copyRow(int *in, int *out, const int nx, const int ny)
{
    // Compute global thread id
    unsigned int idx = threadIdx.x + blockIdx.x * blockDim.x;
    unsigned int idy = threadIdx.y + blockIdx.y * blockDim.y;

    // Flatten 2D grid into linear index
    unsigned int index = idy * nx + idx;

    // Ensure index is within array bounds
    if (idx < nx && idy < ny)
    {
        // Perform copy operation
        out[index] = in[index];
    }
}