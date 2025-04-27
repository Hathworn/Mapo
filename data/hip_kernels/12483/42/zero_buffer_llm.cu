#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void zero_buffer(const int x, const int y, double* buffer)
{
    // Calculate 2D grid and block indices to improve performance
    const int ix = blockIdx.x * blockDim.x + threadIdx.x;
    const int iy = blockIdx.y * blockDim.y + threadIdx.y;

    // Calculate unique global index
    const int gid = iy * x + ix;

    // Ensure gid is within the bounds of the buffer
    if (ix < x && iy < y)
    {
        buffer[gid] = 0.0;
    }
}