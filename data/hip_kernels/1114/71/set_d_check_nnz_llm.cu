#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void set_d_check_nnz(int *d_check_nnz, int *d_nnz_num, int pad_M, int SIGMA, int sigma_block_row)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    if (i >= pad_M) {
        return;
    }

    // Calculate the index for d_nnz_num and d_check_nnz
    int nnz_index = blockIdx.y * pad_M + i;
    int check_index = blockIdx.y * sigma_block_row + i / SIGMA;
    
    // Avoid checking d_nnz_num repeatedly
    if (d_nnz_num[nnz_index] > 0) {
        atomicAdd(&d_check_nnz[check_index], 1);  // Perform atomic addition more efficiently
    }
}