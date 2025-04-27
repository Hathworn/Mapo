#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void gpu_stencil37_hack2_cp_rows(double * dst, double * shared_rows, double *shared_cols, double *shared_slices, int d_xpitch, int d_ypitch, int d_zpitch, int s_xpitch, int s_ypitch, int s_zpitch, int n_rows, int n_cols, int n_slices, int tile_x, int tile_y, int tile_z) {

    int base_global_slice = tile_z * blockIdx.z;
    int base_global_row = tile_y * blockIdx.y;
    int base_global_col = blockDim.x * blockIdx.x;
    int dst_area = d_ypitch * d_xpitch;
    int s_area = gridDim.y * s_xpitch * 2;

    int base_global_idx = base_global_slice * dst_area + base_global_row * d_xpitch + base_global_col;

    int nextRow = base_global_row + 1;
    bool legalNextRow = nextRow < n_rows;

    int tx = threadIdx.x;
    bool legalCurCol = (base_global_col + tx) < n_cols;

    for (int tz = 0; tz < tile_z; ++tz) {
        bool legalCurSlice = (base_global_slice + tz) < n_slices;
        int idx_dst = base_global_idx + tz * dst_area + tx;
        int idx = (base_global_slice + tz) * s_area + blockIdx.y * s_xpitch * 2 + blockIdx.x * blockDim.x + tx;
        
        // Copy from dst to shared_rows if the column and slice are valid
        if (legalCurCol && legalCurSlice) {
            shared_rows[idx] = dst[idx_dst];
        }
        // Copy the next row if it is valid
        if (legalCurCol && legalCurSlice && legalNextRow) {
            shared_rows[idx + s_xpitch] = dst[idx_dst + d_xpitch];
        }
    }

    __syncthreads();
}