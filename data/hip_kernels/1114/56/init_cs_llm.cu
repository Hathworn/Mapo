#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void init_cs(int *d_cl, int *d_cs, int c_size, int chunk)
{
    // Using a single thread to initialize the first element
    if (blockIdx.x == 0 && threadIdx.x == 0) {
        d_cs[0] = 0;
    }

    // Calculate global index
    int i = blockIdx.x * blockDim.x + threadIdx.x + 1;

    // Check bounds and compute d_cs
    if (i < c_size) {
        d_cs[i] = d_cl[i - 1] * chunk;
    }
}