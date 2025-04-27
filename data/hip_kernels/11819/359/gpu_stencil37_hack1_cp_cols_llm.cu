#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void gpu_stencil37_hack1_cp_cols(double * dst, double * shared_rows, double *shared_cols, double *shared_slices, int n_rows, int n_cols, int n_slices, int tile_x, int tile_y, int tile_z) {
    // Define base indices and area calculations
    int base_global_slice = tile_z * blockIdx.z;
    int base_global_row = blockDim.y * blockIdx.y;
    int base_global_col = tile_x * blockIdx.x;

    int area_dst = n_rows * n_cols;
    int area_shared = gridDim.x * n_rows * 2;

    int base_global_idx = base_global_slice * area_dst + base_global_row * n_cols + base_global_col;

    int nextCol = base_global_col + 1;
    bool legalNextCol = (nextCol < n_cols);

    int ty = threadIdx.y;
    bool legalCurRow = (base_global_row + ty) < n_rows;

    // Loop over z-dimension tiles
    for (int tz = 0; tz < tile_z; ++tz) {
        bool legalCurSlice = (base_global_slice + tz) < n_slices;
        int idx_dst = base_global_idx + tz * area_dst + ty * n_cols;
        int idx = (base_global_slice + tz) * area_shared + blockIdx.x * 2 * n_rows + blockIdx.y * blockDim.y + ty;

        // Use conditional read and store for both current and next column
        if (legalCurRow && legalCurSlice) {
            shared_cols[idx] = dst[idx_dst];
            if (legalNextCol) {
                shared_cols[idx + n_rows] = dst[idx_dst + 1];
            }
        }

        __syncthreads(); // Synchronize threads within the block after each iteration
    }
    __syncthreads(); // Final synchronization to ensure completion of all operations
}