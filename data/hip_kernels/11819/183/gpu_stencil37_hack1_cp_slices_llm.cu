#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void gpu_stencil37_hack1_cp_slices(double * dst, double * shared_rows, double *shared_cols, double *shared_slices, int n_rows, int n_cols, int n_slices, int tile_x, int tile_y, int tile_z) {

#ifdef CUDA_DARTS_DEBUG
    if ((blockIdx.x == 0) && (blockIdx.y == 0) && (blockIdx.z == 0) && (threadIdx.x == 0)) {
        printf("copy slices begin!\n");
        printf("gridDim.x=%d,gridDim.y=%d,gridDim.z=%d\n", gridDim.x, gridDim.y, gridDim.z);
        printf("blockDim.x=%d,blockDim.y=%d,blockDim.z=%d\n", blockDim.x, blockDim.y, blockDim.z);
        printf("tile_x=%d,tile_y=%d,tile_z=%d\n", tile_x, tile_y, tile_z);
    }
#endif

    int base_global_slice = tile_z * blockIdx.z;
    int base_global_row = tile_y * blockIdx.y;
    int base_global_col = blockDim.x * blockIdx.x;

    int area = n_rows * n_cols;
    int base_global_idx = base_global_slice * area + base_global_row * n_cols + base_global_col;

    int nextSlice = base_global_slice + 1;
    bool legalNextSlice = (nextSlice < n_slices);
    int tx = threadIdx.x;
    bool legalCurCol = (base_global_col + tx) < n_cols;

    for (int ty = 0; ty < tile_y; ++ty) {
        int curRow = base_global_row + ty;
        bool legalCurRow = curRow < n_rows;
        int idx = blockIdx.z * area * 2 + curRow * n_cols + base_global_col + tx;
        int idx_dst = base_global_idx + ty * n_cols + tx;

        // Improved condition check to minimize branch divergence
        if (legalCurCol && legalCurRow) {
            shared_slices[idx] = dst[idx_dst];
            if (legalNextSlice) {
                shared_slices[idx + area] = dst[idx_dst + area];
            }
        }
    }
    __syncthreads();

#ifdef CUDA_CUDA_DEBUG
    if (blockIdx.z == 0 && blockIdx.y == 0 && blockIdx.x == 1) {
        if (threadIdx.x == 0 || threadIdx.x == 1 || threadIdx.x == 2) {
            int addr = n_cols * n_rows + blockDim.x * blockIdx.x + threadIdx.x;
            int addr1 = n_cols * n_rows + blockDim.x * blockIdx.x + threadIdx.x + n_cols;
            int addr2 = n_cols * n_rows + blockDim.x * blockIdx.x + threadIdx.x + n_cols * 2;
            printf("blockIdx.x=%d, blockIdx.y=%d, blockIdx.z=%d,shared_slices: addr= %d, val= %f\n", blockIdx.x, blockIdx.y, blockIdx.z, addr, shared_slices[addr]);
            printf("blockIdx.x=%d, blockIdx.y=%d, blockIdx.z=%d,shared_slices: addr= %d, val= %f\n", blockIdx.x, blockIdx.y, blockIdx.z, addr1, shared_slices[addr1]);
            printf("blockIdx.x=%d, blockIdx.y=%d, blockIdx.z=%d,shared_slices: addr= %d, val= %f\n", blockIdx.x, blockIdx.y, blockIdx.z, addr2, shared_slices[addr2]);
        }
    }
#endif

#ifdef CUDA_DARTS_DEBUG
    if ((blockIdx.x == 0) && (blockIdx.y == 0) && (blockIdx.z == 0) && (threadIdx.x == 0)) {
        printf("copy slices end!\n");
    }
#endif
}