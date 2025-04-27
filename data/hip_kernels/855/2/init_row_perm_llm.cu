#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void init_row_perm(int *d_permutation, int M)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    if (i < M) { // Simplify condition check
        d_permutation[i] = i; // Direct assignment inside condition
    }
}