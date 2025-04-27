#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void init_check(int *d_check, int nz)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Use grid-stride loop for improved parallelism
    for (; i < nz; i += blockDim.x * gridDim.x)
    {
        d_check[i] = -1;
    }
}