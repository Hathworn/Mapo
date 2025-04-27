#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel5(int *a, int dimx, int dimy) 
{
    // Calculate flattened global index for the 2D grid
    int idx = blockIdx.y * blockDim.y * dimx + blockIdx.x * blockDim.x + threadIdx.y * dimx + threadIdx.x;

    // Check boundaries and assign value
    if (threadIdx.x < dimx && threadIdx.y < dimy) 
    {
        a[idx] = blockIdx.y;
    }
}