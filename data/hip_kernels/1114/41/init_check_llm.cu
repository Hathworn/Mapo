#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void init_check(int *d_check, int nz)
{
    // Calculate the global thread index
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Use branch-less assignment within bounds
    if (i < nz) {
        d_check[i] = -1;
    }
}