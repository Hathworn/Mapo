```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void init_row_perm(int *d_permutation, int M)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    if (i < M) { // Combine the two operations into one to enhance readability and performance
        d_permutation[i] = i;
    }
}