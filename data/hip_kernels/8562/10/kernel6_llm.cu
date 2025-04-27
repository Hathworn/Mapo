#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void kernel6( int *a, int dimx, int dimy )
{
    int ix = blockIdx.x * blockDim.x + threadIdx.x;
    int iy = blockIdx.y * blockDim.y + threadIdx.y;
    if(ix < dimx && iy < dimy) // Check bounds before calculating index
    {
        int idx = iy * dimx + ix;
        a[idx] = blockIdx.x;
    }
}