#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void set_d_check_nnz(int *d_check_nnz, int *d_nnz_num, int pad_M, int SIGMA, int sigma_block_row)
{
    // Compute global thread index
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    if (i >= pad_M) {
        return;
    }

    // Pre-calculate indices used multiple times
    int idx_y_m = blockIdx.y * pad_M + i;
    int idx_y_sigma = blockIdx.y * sigma_block_row + i / SIGMA;

    // Use scalar variable for atomic operation consistency
    if (d_nnz_num[idx_y_m] > 0) {
        atomicAdd(&(d_check_nnz[idx_y_sigma]), 1); // No need for an additional variable 'a'
    }
}