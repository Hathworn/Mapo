#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void matmul_kernel(float *C, float *A, float *B) {

    __shared__ float sA[block_size_y * tile_size_y][block_size_x];
    __shared__ float sB[block_size_x][block_size_x * tile_size_x];

    int tx = threadIdx.x;
    int ty = threadIdx.y;
    int x = blockIdx.x * block_size_x * tile_size_x + tx;
    int y = blockIdx.y * block_size_y * tile_size_y + ty;
    int k, kb;

    float sum[tile_size_y][tile_size_x] = {0.0f};

    for (k = 0; k < WIDTH; k += block_size_x) {

        // Load data to shared memory
        #pragma unroll
        for (int i = 0; i < tile_size_y; i++) {
            int sharedY = ty + block_size_y * i;
            sA[sharedY][tx] = A[(y + sharedY - ty) * WIDTH + k + tx];

            #pragma unroll
            for (int j = 0; j < tile_size_x; j++) {
                sB[tx][sharedY * tile_size_x + j] = B[(k + blockIdx.y * block_size_y * tile_size_y + sharedY) * WIDTH + x + j * block_size_x];
            }
        }
        __syncthreads();

        // Matrix multiplication using shared memory
        #pragma unroll
        for (kb = 0; kb < block_size_x; kb++) {

            #pragma unroll
            for (int i = 0; i < tile_size_y; i++) {
                #pragma unroll
                for (int j = 0; j < tile_size_x; j++) {
                    sum[i][j] += sA[ty + block_size_y * i][kb] * sB[kb][tx + j * block_size_x];
                }
            }
        }
        __syncthreads();
    }

    // Store result back to global memory
    #pragma unroll
    for (int i = 0; i < tile_size_y; i++) {
        #pragma unroll
        for (int j = 0; j < tile_size_x; j++) {
            C[y * WIDTH + x + block_size_y * i * WIDTH + j * block_size_x] = sum[i][j];
        }
    }
}