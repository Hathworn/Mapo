#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void matmul_kernel(float *C, float *A, float *B) {

    __shared__ float sA[block_size_y][block_size_x * tile_size_y];
    __shared__ float sB[block_size_y][block_size_x * tile_size_x];

    int tx = threadIdx.x;
    int ty = threadIdx.y;
    int x = blockIdx.x * block_size_x * tile_size_x + tx;
    int y = blockIdx.y * block_size_y + ty;

    float sum[tile_size_y][tile_size_x] = {0}; // Initialize accumulators

    for (int k = 0; k < WIDTH; k += block_size_x) {

        __syncthreads();
        // Coalesced loading
        #pragma unroll
        for (int i = 0; i < tile_size_y; i++) {
            int y_index = y + i * block_size_y;
            sA[ty][tx + i * block_size_x] = A[y_index * WIDTH + k + tx];
        }

        #pragma unroll
        for (int j = 0; j < tile_size_x; j++) {
            int b_index = (k + ty) * WIDTH + x + j * block_size_x;
            sB[ty][tx + j * block_size_x] = B[b_index];
        }

        __syncthreads();

        // Compute partial results
        #pragma unroll
        for (int kb = 0; kb < block_size_x; kb++) {
            #pragma unroll
            for (int i = 0; i < tile_size_y; i++) {
                float regA = sA[ty][kb + i * block_size_x];
                #pragma unroll
                for (int j = 0; j < tile_size_x; j++) {
                    sum[i][j] += regA * sB[kb][tx + j * block_size_x];
                }
            }
        }
    }

    // Store the final results
    #pragma unroll
    for (int i = 0; i < tile_size_y; i++) {
        int y_index = (y + i * block_size_y) * WIDTH;
        #pragma unroll
        for (int j = 0; j < tile_size_x; j++) {
            C[y_index + x + j * block_size_x] = sum[i][j];
        }
    }
}