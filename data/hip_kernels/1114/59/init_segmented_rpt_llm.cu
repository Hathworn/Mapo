#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void init_segmented_rpt(int *d_nnz_num, int *d_seg_rpt, int total_pad_row_num)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    if (i < total_pad_row_num) { // Simplified boundary condition
        // Use a single conditional statement to improve warp efficiency
        d_seg_rpt[i] = (i == 0) ? 0 : d_nnz_num[i - 1];
    }
}