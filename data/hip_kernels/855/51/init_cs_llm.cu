#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void init_cs(int *d_cl, int *d_cs, int c_size, int chunk)
{
    // Calculate global index
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Exit if index is out of bounds
    if (i >= c_size) return;

    // Initialize d_cs using ternary operator for concise code
    d_cs[i] = (i == 0) ? 0 : d_cl[i - 1] * chunk;
}