#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void gpu_stencil2D_4pt_hack5_cp_cols(double * dst, double * shared_cols, double * shared_rows, int tile_x, int tile_y, int M, int N) {

#ifdef CUDA_DARTS_DEBUG
if ((blockIdx.x == 0) && (blockIdx.y == 0) && (threadIdx.y == 0)) {
    printf("copy cols begin!\n");
}
#endif

// Precompute indices to reduce redundant calculations
int base_global_idx = N * tile_y * blockIdx.y + tile_x * blockIdx.x;
int nextCol = base_global_idx + 1;
int shift = 2 * M * blockIdx.x + threadIdx.y;
int idx = shift + tile_y * blockIdx.y;
bool legalCurRow = (tile_y * blockIdx.y + threadIdx.y) < M;

if (legalCurRow) {
    shared_cols[idx] = dst[base_global_idx + threadIdx.y * N];
    if (nextCol < N) {
        shared_cols[idx + M] = dst[nextCol + threadIdx.y * N];
    }
}

// Ensure all threads are synchronized before proceeding
__syncthreads();

#ifdef CUDA_CUDA_DEBUG
if (blockIdx.x == 1 && threadIdx.y < 5) {
    printf("addr: %d, %f,\n", idx + M, shared_cols[idx + M]);
}
#endif

#ifdef CUDA_DARTS_DEBUG
if ((blockIdx.x == 0) && (blockIdx.y == 0) && (threadIdx.y == 0)) {
    printf("copy cols finish!\n");
}
#endif
}