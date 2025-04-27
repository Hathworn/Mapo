#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel(int *a, int dimx, int dimy)
{
    // Calculate global thread index
    int ix = blockIdx.x * blockDim.x + threadIdx.x;
    int iy = blockIdx.y * blockDim.y + threadIdx.y;

    // Bounds check to ensure index is within matrix dimensions
    if (ix < dimx && iy < dimy) {
        int idx = iy * dimx + ix;
        a[idx] = a[idx] + 1;
    }
}