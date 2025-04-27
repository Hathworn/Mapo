#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void matmul_kernel(float *C, float *A, float *B) {
    // Calculate unique index for thread
    int x = blockIdx.x * block_size_x + threadIdx.x;
    int y = blockIdx.y * block_size_y + threadIdx.y;

    // Use shared memory to optimize memory access
    __shared__ float sharedA[block_size_y][WIDTH];
    __shared__ float sharedB[WIDTH][block_size_x];

    // Initialize accumulation variable
    float sum = 0.0;

    // Loop through segments of A and B
    for (int k = 0; k < WIDTH/block_size_y; k++) {
        // Load elements into shared memory
        sharedA[threadIdx.y][k*block_size_y+threadIdx.x] = A[y*WIDTH + k*block_size_y + threadIdx.x];
        sharedB[k*block_size_y+threadIdx.y][threadIdx.x] = B[(k*block_size_y+threadIdx.y)*WIDTH + x];
        __syncthreads(); // Synchronize threads within a block

        // Perform partial dot product using shared memory
        for (int n = 0; n < block_size_y; n++) {
            sum += sharedA[threadIdx.y][n] * sharedB[n][threadIdx.x];
        }
        __syncthreads(); // Synchronize before new segment is loaded
    }

    // Store result in global memory
    C[y*WIDTH + x] = sum;
}