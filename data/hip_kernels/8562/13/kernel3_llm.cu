#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel3( int *a, int dimx, int dimy )
{
    // Calculate the flattened thread id
    int idx = blockIdx.x * blockDim.x + threadIdx.x + (blockIdx.y * blockDim.y + threadIdx.y) * dimx;

    // Guard against out-of-bounds access
    if (idx < dimx * dimy) {
        a[idx] = idx;
    }
}