#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void gpu_stencil37_hack1_cp_cols(double *dst, double *shared_rows, double *shared_cols, double *shared_slices, int n_rows, int n_cols, int n_slices, int tile_x, int tile_y, int tile_z) {

#ifdef CUDA_DARTS_DEBUG
    if ((blockIdx.x == 0) && (blockIdx.y == 0) && (blockIdx.z == 0) && (threadIdx.y == 0) && (threadIdx.x == 0) && (threadIdx.z == 0)) {
        printf("copy cols: begin\n");
        printf("copy cols: gridDim.x=%d,gridDim.y=%d,gridDim.z=%d\n", gridDim.x, gridDim.y, gridDim.z);
        printf("copy cols: blockDim.x=%d,blockDim.y=%d,blockDim.z=%d\n", blockDim.x, blockDim.y, blockDim.z);
        printf("copy cols: tile_x=%d,tile_y=%d,tile_z=%d\n", tile_x, tile_y, tile_z);
    }
#endif

    int base_global_slice = tile_z * blockIdx.z;
    int base_global_row = blockDim.y * blockIdx.y;
    int base_global_col = tile_x * blockIdx.x;

    int area_dst = n_rows * n_cols;
    int area_shared = gridDim.x * n_rows * 2;

#ifdef CUDA_CUDA_DEBUG
    if ((blockIdx.x == 0) && (blockIdx.y == 0) && (blockIdx.z == 0) && (threadIdx.y == 0) && (threadIdx.x == 0) && (threadIdx.z == 0)) {
        printf("area_shared=%d\n", area_shared);
    }
#endif

    int base_global_idx = base_global_slice * area_dst + base_global_row * n_cols + base_global_col;
    int nextCol = base_global_col + 1;
    bool legalNextCol = (nextCol < n_cols);
    int ty = threadIdx.y;
    bool legalCurRow = (base_global_row + ty) < n_rows;

    int idx_base_shared = (base_global_slice) * area_shared + blockIdx.x * 2 * n_rows + blockIdx.y * blockDim.y;

    for (int tz = 0; tz < tile_z; ++tz) {
        bool legalCurSlice = (base_global_slice + tz) < n_slices;
        int idx_dst = base_global_idx + tz * area_dst + ty * n_cols;
        int idx_shared = idx_base_shared + ty + tz * area_shared;

        // Use condition branching to avoid warp divergence
        if (legalCurRow && legalCurSlice) {
            shared_cols[idx_shared] = dst[idx_dst];
            if (legalNextCol) {
                shared_cols[idx_shared + n_rows] = dst[idx_dst + 1];
            }
        }

        __syncthreads(); // Here is required if data in shared_cols is accessed by multiple threads
    }

    __syncthreads();

#ifdef CUDA_CUDA_DEBUG
    if (blockIdx.z == 0 && blockIdx.y == 0 && blockIdx.x == 0 && (threadIdx.x == 0)) {
        //printf("shared_cols: addr:%d, val = %f\n", threadIdx.y,shared_cols[threadIdx.y]);
    }
#endif

#ifdef CUDA_DARTS_DEBUG
    if ((blockIdx.x == 0) && (blockIdx.y == 0) && (blockIdx.z == 0) && (threadIdx.y == 0) && (threadIdx.x == 0) && (threadIdx.z == 0)) {
        printf("copy cols end!\n");
    }
#endif
}