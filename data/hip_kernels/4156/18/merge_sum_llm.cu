#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void merge_sum(unsigned char * img_all, unsigned char * img, float * selection, float * selection_sum, int n, int stride)
{
    int x = blockIdx.x * TILE_DIM + threadIdx.x;
    int y = blockIdx.y * TILE_DIM + threadIdx.y;
    int width = gridDim.x * TILE_DIM;

    // Early exit if out-of-bounds
    if (x >= width || y >= width) return;

    int idx;
    float weight = 0;

    // Use shared memory for intermediate image data
    __shared__ unsigned char shared_img[TILE_DIM * BLOCK_ROWS * 3];

    for (int j = 0; j < TILE_DIM; j += BLOCK_ROWS) {

        // Initialize shared memory
        shared_img[((j + threadIdx.y) * TILE_DIM + threadIdx.x) * 3] = 0;
        shared_img[((j + threadIdx.y) * TILE_DIM + threadIdx.x) * 3 + 1] = 0;
        shared_img[((j + threadIdx.y) * TILE_DIM + threadIdx.x) * 3 + 2] = 0;

        for (idx = 0; idx < n; idx++) {
            weight = selection[idx * stride + ((y + j) * width + x)] / selection_sum[((y + j) * width + x)];

            int offset = idx * stride * 3 + 3 * ((y + j) * width + x);
            
            // Accumulate weighted values in shared memory
            shared_img[((j + threadIdx.y) * TILE_DIM + threadIdx.x) * 3] += (unsigned char)(img_all[offset] * weight);
            shared_img[((j + threadIdx.y) * TILE_DIM + threadIdx.x) * 3 + 1] += (unsigned char)(img_all[offset + 1] * weight);
            shared_img[((j + threadIdx.y) * TILE_DIM + threadIdx.x) * 3 + 2] += (unsigned char)(img_all[offset + 2] * weight);
        }

        // Sync threads before writing back to global memory
        __syncthreads();

        // Write back results from shared memory
        img[3 * ((y + j) * width + x)] = shared_img[((j + threadIdx.y) * TILE_DIM + threadIdx.x) * 3];
        img[3 * ((y + j) * width + x) + 1] = shared_img[((j + threadIdx.y) * TILE_DIM + threadIdx.x) * 3 + 1];
        img[3 * ((y + j) * width + x) + 2] = shared_img[((j + threadIdx.y) * TILE_DIM + threadIdx.x) * 3 + 2];
    }
}