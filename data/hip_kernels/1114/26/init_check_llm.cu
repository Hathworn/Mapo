#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void init_check(int *d_check, int nz)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    
    if (i < nz) { // Combine condition check to improve warp efficiency
        d_check[i] = -1;
    }
}