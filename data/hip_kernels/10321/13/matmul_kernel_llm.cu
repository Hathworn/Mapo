```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void matmul_kernel(float *C, float *A, float *B) {

    extern __shared__ float shared[];
    float* sA = &shared[0];
    float* sB = &shared[block_size_y * tile_size_y * block_size_x];

    int tx = threadIdx.x;
    int ty = threadIdx.y;
    int x = blockIdx.x * block_size_x * tile_size_x + tx;
    int y = blockIdx.y * block_size_y * tile_size_y + ty;
    int k, kb;

    float sum[tile_size_y][tile_size_x] = {0}; // Initialize sums

    for (k = 0; k < WIDTH; k += block_size_x) {

        __syncthreads();

        #pragma unroll
        for (int i = 0; i < tile_size_y; i++) {
            // Load tiles into shared memory
            sA[(ty + block_size_y * i) * block_size_x + tx] = A[(y + i * block_size_y) * WIDTH + k + tx];

            #pragma unroll
            for (int j = 0; j < tile_size_x; j++) {
                sB[(ty + block_size_y * i) * (block_size_x * tile_size_x) + (tx + j * block_size_x)] = 
                    B[(k + ty + block_size_y * i) * WIDTH + (x + j * block_size_x)];
            }
        }

        __syncthreads();

        #pragma unroll
        for (kb = 0; kb < block_size_x; kb++) {
            #pragma unroll
            for (int i = 0; i < tile_size_y; i++) {
                #pragma unroll
                for (int j = 0; j < tile_size_x; j++) {
                    // Compute local product
                    sum[i][j] += sA[(ty + block_size_y * i) * block_size_x + kb] * 
                                 sB[kb * (block_size_x * tile_size_x) + (tx + j * block_size_x)];
                }
            }
        }
    }

    // Store result
    #pragma unroll
    for (int i = 0; i < tile_size_y; i++) {
        #pragma unroll
        for (int j = 0; j < tile_size_x; j++) {
            C[(y + block_size_y * i) * WIDTH + (x + j * block_size_x)] = sum[i][j];
        }
    }
}