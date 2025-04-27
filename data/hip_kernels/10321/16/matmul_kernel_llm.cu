#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void matmul_kernel(float *C, float *A, float *B) {

    __shared__ float sA[block_size_y * tile_size_y][block_size_x];
    __shared__ float sB[block_size_y * tile_size_y][block_size_x * tile_size_x];

    int tx = threadIdx.x;
    int ty = threadIdx.y;
    int x = blockIdx.x * block_size_x * tile_size_x + threadIdx.x;
    int y = blockIdx.y * block_size_y * tile_size_y + threadIdx.y;

    float sum[tile_size_y][tile_size_x] = {0}; // Initialize in declaration

    for (int k = 0; k < WIDTH; k += block_size_x) {

        __syncthreads();
        #pragma unroll
        for (int i = 0; i < tile_size_y; i++) {
            int row_a = y + i * block_size_y;
            int row_b = k + ty + block_size_y * i; 

            sA[ty + block_size_y * i][tx] = A[row_a * WIDTH + k + tx];

            #pragma unroll
            for (int j = 0; j < tile_size_x; j++) {
                sB[ty + block_size_y * i][tx + j * block_size_x] = B[row_b * WIDTH + x + j * block_size_x];
            }
        }
        __syncthreads();

        // Compute
        #pragma unroll
        for (int kb = 0; kb < block_size_x; kb++) {
            #pragma unroll
            for (int i = 0; i < tile_size_y; i++) {
                float valA = sA[ty + block_size_y * i][kb]; // Cache value from sA
                #pragma unroll
                for (int j = 0; j < tile_size_x; j++) {
                    sum[i][j] += valA * sB[kb][tx + j * block_size_x];
                }
            }
        }
    }

    // Store result
    #pragma unroll
    for (int i = 0; i < tile_size_y; i++) {
        #pragma unroll
        for (int j = 0; j < tile_size_x; j++) {
            C[y * WIDTH + x + block_size_y * i * WIDTH + j * block_size_x] = sum[i][j];
        }
    }
}