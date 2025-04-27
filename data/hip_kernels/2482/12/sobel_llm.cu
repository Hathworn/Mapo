#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void sobel(int width_d, int height_d, int threshold_d, unsigned int *pic_d, int *final_res) {
    int row_1 = blockIdx.y * blockDim.y + threadIdx.y;
    int col_1 = blockIdx.x * blockDim.x + threadIdx.x;
    int tx = threadIdx.y;
    int ty = threadIdx.x;
    int width_Tile = TILE_SIZE;

    __shared__ int sharedTile[TILE_SIZE * TILE_SIZE];
    int magnitude, sum1, sum2;

    // Initialize shared memory tile
    if ((row_1 < height_d) && (col_1 < width_d)) {
        sharedTile[tx * width_Tile + ty] = pic_d[row_1 * width_d + col_1];
    } else {
        sharedTile[tx * width_Tile + ty] = 0;
    }
    __syncthreads();

    if (row_1 > 0 && col_1 > 0 && row_1 < height_d - 1 && col_1 < width_d - 1) {
        // Applying Sobel Filter using shared memory
        if ((tx > 0) && (tx < width_Tile - 1) && (ty > 0) && (ty < width_Tile - 1)) {
            sum1 = sharedTile[(tx-1) * width_Tile + (ty+1)] - sharedTile[(tx-1) * width_Tile + (ty-1)]
                 + 2 * sharedTile[tx * width_Tile + (ty+1)] - 2 * sharedTile[tx * width_Tile + (ty-1)]
                 + sharedTile[(tx+1) * width_Tile + (ty+1)] - sharedTile[(tx+1) * width_Tile + (ty-1)];

            sum2 = sharedTile[(tx-1) * width_Tile + (ty-1)] + 2 * sharedTile[(tx-1) * width_Tile + ty]
                 + sharedTile[(tx-1) * width_Tile + (ty+1)] - sharedTile[(tx+1) * width_Tile + (ty-1)]
                 - 2 * sharedTile[(tx+1) * width_Tile + ty] - sharedTile[(tx+1) * width_Tile + (ty+1)];

            magnitude = sum1 * sum1 + sum2 * sum2;

            final_res[row_1 * width_d + col_1] = (magnitude > threshold_d) ? 255 : 0;
        }
        __syncthreads();

        // Process pixels at the boundaries using global memory
        if ((tx == 0) || (ty == 0) || (tx == width_Tile - 1) || (ty == width_Tile - 1)) {
            if ((row_1 < height_d) && (col_1 < width_d)) {
                sum1 = pic_d[(row_1-1) * width_d + (col_1+1)] - pic_d[(row_1-1) * width_d + (col_1-1)]
                     + 2 * pic_d[row_1 * width_d + (col_1+1)] - 2 * pic_d[row_1 * width_d + (col_1-1)]
                     + pic_d[(row_1+1) * width_d + (col_1+1)] - pic_d[(row_1+1) * width_d + (col_1-1)];

                sum2 = pic_d[(row_1-1) * width_d + (col_1-1)] + 2 * pic_d[(row_1-1) * width_d + col_1]
                     + pic_d[(row_1-1) * width_d + (col_1+1)] - pic_d[(row_1+1) * width_d + (col_1-1)]
                     - 2 * pic_d[(row_1+1) * width_d + col_1] - pic_d[(row_1+1) * width_d + (col_1+1)];

                magnitude = sum1 * sum1 + sum2 * sum2;

                final_res[row_1 * width_d + col_1] = (magnitude > threshold_d) ? 255 : 0;
            }
        }
    }
}