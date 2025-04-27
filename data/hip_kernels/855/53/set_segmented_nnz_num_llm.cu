#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void set_segmented_nnz_num(int *d_rpt, int *d_col, int *d_nnz_num, int *d_group_seg, int *d_offset, size_t seg_size, size_t seg_num, int M, int pad_M, int group_num_col)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    if (i >= M) {
        return;
    }

    int offset = d_rpt[i];
    int width = d_rpt[i + 1] - offset;

    // Unroll loop for better performance
    for (int j = 0; j < width; j++) {
        int index = offset + j;
        int col = d_col[index];
        int g = col / seg_size;

        // Use atomic operation for synchronization
        int nnz_index = atomicAdd(&d_nnz_num[g * pad_M + i], 1);
        d_offset[index] = nnz_index;
        d_group_seg[index] = g;
    }
}