```c
#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void copyCol(int *in, int *out, const int nx, const int ny)
{
    // Combine ix and iy calculation for cleaner code
    unsigned int id = threadIdx.x + blockIdx.x * blockDim.x + 
                      (threadIdx.y + blockIdx.y * blockDim.y) * nx;

    // Use one calculation to check bounds
    if (id < nx * ny)
    {
        out[id] = in[id];
    }
}