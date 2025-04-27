#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void set_segmented_nnz_num(int *d_rpt, int *d_col, int *d_nnz_num, int *d_group_seg, int *d_offset, size_t seg_size, size_t seg_num, int M, int pad_M, int group_num_col)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Early return for out-of-bounds thread index
    if (i >= M) {
        return;
    }

    int offset = d_rpt[i];
    int width = d_rpt[i + 1] - d_rpt[i];

    for (int j = 0; j < width; j++) {
        int index = offset + j;
        int col = d_col[index];
        int g = col / seg_size;

        // Use atomic operations for concurrent writes
        int nnz_index = g * pad_M + i;
        int nnz_temp = atomicAdd(&d_nnz_num[nnz_index], 1);
        d_offset[index] = nnz_temp;
        d_group_seg[index] = g;
    }
}