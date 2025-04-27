#include "hip/hip_runtime.h"
#include "includes.h"

// Optimize global kernel function
__global__ void kernel2( int *a, int dimx, int dimy )
{
    int ix = blockIdx.x * blockDim.x + threadIdx.x;
    int iy = blockIdx.y * blockDim.y + threadIdx.y;
    
    // Ensuring the thread is within bounds
    if (ix < dimx && iy < dimy) {
        int idx = iy * dimx + ix;
        a[idx] = (blockIdx.x + blockIdx.y);
    }
}