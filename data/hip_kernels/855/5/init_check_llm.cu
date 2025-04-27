#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void init_check(int *d_check, int nz)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    // Early exit for out-of-bounds thread
    if (i < nz) {
        d_check[i] = -1;
    }
}