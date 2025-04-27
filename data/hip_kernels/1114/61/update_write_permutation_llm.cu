#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void update_write_permutation(int *write_permutation, int *nnz_num, int total_pad_row_num, int pad_M)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    if (i < total_pad_row_num)  // Simplified condition to prevent out-of-bounds access
    {
        write_permutation[i] -= (i / pad_M) * pad_M;  // Calculating the reduction in a single step and applying
    }
}