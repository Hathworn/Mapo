#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void init_check(int *d_check, int nz)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    if (i < nz) {  // Process only valid indices
        d_check[i] = -1;
    }
}