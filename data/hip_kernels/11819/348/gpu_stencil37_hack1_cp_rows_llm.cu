#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void gpu_stencil37_hack1_cp_rows(double *dst, double *shared_rows, double *shared_cols, double *shared_slices, uint64_t n_rows, uint64_t n_cols, uint64_t n_slices, int tile_x, int tile_y, int tile_z) {
    
#ifdef CUDA_DARTS_DEBUG
    if ((blockIdx.x == 0) && (blockIdx.y == 0) && (blockIdx.z == 0) && (threadIdx.x == 0)) {
        printf("copy rows begin\n");
        printf("gridDim.x=%d,gridDim.y=%d,gridDim.z=%d\n", gridDim.x, gridDim.y, gridDim.z);
        printf("blockDim.x=%d,blockDim.y=%d,blockDim.z=%d\n", blockDim.x, blockDim.y, blockDim.z);
        printf("tile_x=%d,tile_y=%d,tile_z=%d\n", tile_x, tile_y, tile_z);
    }
#endif

    // Compute memory base indices
    int base_global_slice = tile_z * blockIdx.z;
    int base_global_row = tile_y * blockIdx.y;
    int base_global_col = blockDim.x * blockIdx.x;
    int tx = threadIdx.x;

    uint64_t dst_area = n_rows * n_cols;
    uint64_t s_area = gridDim.y * n_cols * 2;

    uint64_t base_global_idx = base_global_slice * dst_area + base_global_row * n_cols + base_global_col;

    int nextRow = base_global_row + 1;
    bool legalNextRow = nextRow < n_rows;
    bool legalCurCol = (base_global_col + tx) < n_cols;

    for (int tz = 0; tz < tile_z; ++tz) {
        bool legalCurSlice = (base_global_slice + tz) < n_slices;

        // Calculate and store shared memory index
        uint64_t idx = (base_global_slice + tz) * s_area + blockIdx.y * n_cols * 2 + blockIdx.x * blockDim.x + tx;

        if (legalCurCol && legalCurSlice) {
            // Copy data to shared memory
            shared_rows[idx] = dst[base_global_idx + tz * dst_area + tx];
            if (legalNextRow) {
                shared_rows[idx + n_cols] = dst[base_global_idx + tz * dst_area + tx + n_cols];
            }
        }
    }
    __syncthreads();
    
#ifdef CUDA_CUDA_DEBUG
    if (blockIdx.y == 0 && blockIdx.x == 0 && blockIdx.z == 0) {
        if ((threadIdx.x == 0 || threadIdx.x == 1 || threadIdx.x == 2) && threadIdx.y == 0) {
            int addr0 = base_global_idx + 0 * dst_area + threadIdx.x;
            int addr = base_global_slice + blockIdx.x * blockDim.x + threadIdx.x;
            int addr1 = s_area * (base_global_slice + 1) + n_cols + blockIdx.x * blockDim.x + threadIdx.x;
            int addr2 = s_area * (base_global_slice + 2) + n_cols + blockIdx.x * blockDim.x + threadIdx.x;
            printf("blockIdx.x=%d, blockIdx.y=%d,blockIdx.z=%d,dst      : z:%d, addr:%d, val = %f\n", blockIdx.x, blockIdx.y, blockIdx.z, 0, addr0, dst[addr0]);
            printf("blockIdx.x=%d, blockIdx.y=%d,blockIdx.z=%d,shared_rows: z:%d, addr:%d, val = %f\n", blockIdx.x, blockIdx.y, blockIdx.z, 0, addr, shared_rows[addr]);
            printf("blockIdx.x=%d, blockIdx.y=%d,blockIdx.z=%d,shared_rows: z:%d, addr:%d, val = %f\n", blockIdx.x, blockIdx.y, blockIdx.z, 1, addr1, shared_rows[addr1]);
            printf("blockIdx.x=%d, blockIdx.y=%d,blockIdx.z=%d,shared_rows: z:%d, addr:%d, val = %f\n", blockIdx.x, blockIdx.y, blockIdx.z, 2, addr2, shared_rows[addr2]);
        }
        if (threadIdx.x == 0 && threadIdx.y == 0) {
            int addr = 2 * s_area + n_cols + 256;
            int addr1 = 2 * dst_area + n_cols + 256;
            printf("shared_rows: addr:%d, val:%f\n", addr, shared_rows[addr]);
            printf("dst        : addr:%d, val:%f\n", addr1, dst[addr1]);
        }
    }
#endif
    
#ifdef CUDA_DARTS_DEBUG
    if ((blockIdx.x == 0) && (blockIdx.y == 0) && (blockIdx.z == 0) && (threadIdx.x == 0)) {
        printf("copy rows end!\n");
    }
#endif
}