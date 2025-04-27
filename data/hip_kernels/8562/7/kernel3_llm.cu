#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void kernel3(int *a, int dimx, int dimy)
{
    // Calculate the flattened global index
    int idx = blockIdx.y * blockDim.y * dimx + blockIdx.x * blockDim.x + threadIdx.y * dimx + threadIdx.x;
    
    // Check bounds and prevent buffer overflow
    if (idx < dimx * dimy)
        a[idx] = idx;
}