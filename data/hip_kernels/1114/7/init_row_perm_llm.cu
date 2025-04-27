#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void init_row_perm(int *d_permutation, int M)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Use grid-stride loop for better parallelism
    for (; i < M; i += blockDim.x * gridDim.x) {
        d_permutation[i] = i;
    }
}