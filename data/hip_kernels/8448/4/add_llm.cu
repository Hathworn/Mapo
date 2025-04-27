#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void add(float *cudaA, float *kernel, float *cudaResult)
{
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    int idy = blockIdx.y * blockDim.y + threadIdx.y;
    int gid = idy * N + idx;

    __shared__ float blockData[BLOCK_SIZE + 2 * BLUR_SIZE][BLOCK_SIZE + 2 * BLUR_SIZE][3];

    // Load the entire blockData, handle boundary conditions
    for (int dy = -BLUR_SIZE; dy <= BLUR_SIZE; dy++) {
        for (int dx = -BLUR_SIZE; dx <= BLUR_SIZE; dx++) {
            int x = idx + dx;
            int y = idy + dy;
            int shared_x = threadIdx.x + BLUR_SIZE + dx;
            int shared_y = threadIdx.y + BLUR_SIZE + dy;
            
            if (x >= 0 && x < N && y >= 0 && y < N) {
                int global_gid = (y * N + x) * 3;
                for (int k = 0; k < 3; k++) {
                    blockData[shared_y][shared_x][k] = cudaA[global_gid + k];
                }
            } else {
                for (int k = 0; k < 3; k++) {
                    blockData[shared_y][shared_x][k] = 0.0f;
                }
            }
        }
    }

    __syncthreads();

    // Apply the kernel
    for (int k = 0; k < 3; k++) {
        float sum = 0.0f;
        for (int i = 0; i <= 2 * BLUR_SIZE; i++) {
            for (int j = 0; j <= 2 * BLUR_SIZE; j++) {
                sum += blockData[threadIdx.y + i][threadIdx.x + j][k] * 
                       kernel[(2 * BLUR_SIZE - i) * (2 * BLUR_SIZE + 1) + (2 * BLUR_SIZE - j)];
            }
        }
        cudaResult[gid * 3 + k] = sum;
    }
}