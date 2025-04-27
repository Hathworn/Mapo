#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel(int *a, int dimx, int dimy)
{
    // Calculate the global thread ID
    int ix = blockIdx.x * blockDim.x + threadIdx.x;
    int iy = blockIdx.y * blockDim.y + threadIdx.y;
    int idx = iy * dimx + ix;

    // Boundary check to ensure safe memory access
    if (ix < dimx && iy < dimy) {
        a[idx] = a[idx] + 1;
    }
}