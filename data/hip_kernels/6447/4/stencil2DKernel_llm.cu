#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void stencil2DKernel(double* temperature, double* new_temperature, int block_x, int block_y, int thread_size) {
    int i_start = (blockDim.x * blockIdx.x + threadIdx.x) * thread_size + 1;
    int i_finish = (blockDim.x * blockIdx.x + threadIdx.x) * thread_size + thread_size;
    int j_start = (blockDim.y * blockIdx.y + threadIdx.y) * thread_size + 1;
    int j_finish = (blockDim.y * blockIdx.y + threadIdx.y) * thread_size + thread_size;

    // Use shared memory for performance optimization
    __shared__ double shared_temperature[32][32]; // Adjust TILE_SIZE according to hardware limits

    for (int i = i_start; i <= i_finish; i++) {
        for (int j = j_start; j <= j_finish; j++) {
            if (i <= block_x && j <= block_y) {
                // Load data into shared memory
                shared_temperature[threadIdx.x][threadIdx.y] = temperature[j * (block_x + 2) + i];
                __syncthreads();

                // Compute new values using shared memory to reduce global memory access
                new_temperature[j * (block_x + 2) + i] = (
                    ((threadIdx.x > 0) ? shared_temperature[threadIdx.x - 1][threadIdx.y] : temperature[j * (block_x + 2) + (i - 1)]) +
                    ((threadIdx.x < blockDim.x - 1) ? shared_temperature[threadIdx.x + 1][threadIdx.y] : temperature[j * (block_x + 2) + (i + 1)]) +
                    ((threadIdx.y > 0) ? shared_temperature[threadIdx.x][threadIdx.y - 1] : temperature[(j - 1) * (block_x + 2) + i]) +
                    ((threadIdx.y < blockDim.y - 1) ? shared_temperature[threadIdx.x][threadIdx.y + 1] : temperature[(j + 1) * (block_x + 2) + i]) +
                    shared_temperature[threadIdx.x][threadIdx.y]
                ) * DIVIDEBY5;

                __syncthreads();
            }
        }
    }
}