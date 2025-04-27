#include "hip/hip_runtime.h"
#include "includes.h"
#define BLOCK_SIZE 16

__global__ void multiply(float *left, float *right, float *res, int dim) {

    float temp = 0;
    __shared__ float Left_shared_t[BLOCK_SIZE][BLOCK_SIZE];
    __shared__ float Right_shared_t[BLOCK_SIZE][BLOCK_SIZE];

    int row = blockIdx.y * blockDim.y + threadIdx.y;
    int col = blockIdx.x * blockDim.x + threadIdx.x;

    for (int tileNUM = 0; tileNUM < gridDim.x; tileNUM++) {

        int i = tileNUM * BLOCK_SIZE + threadIdx.y;
        int j = tileNUM * BLOCK_SIZE + threadIdx.x;

        // Load left and right matrix into shared memory
        if (row < dim && j < dim) {
            Left_shared_t[threadIdx.y][threadIdx.x] = left[row * dim + j];
        } else {
            Left_shared_t[threadIdx.y][threadIdx.x] = 0.0f; // Boundary condition handling
        }

        if (i < dim && col < dim) {
            Right_shared_t[threadIdx.y][threadIdx.x] = right[i * dim + col];
        } else {
            Right_shared_t[threadIdx.y][threadIdx.x] = 0.0f; // Boundary condition handling
        }

        // Synchronize before computation
        __syncthreads();

        // Perform matrix multiplication on the block
        for (int k = 0; k < BLOCK_SIZE; k++) {
            temp += Left_shared_t[threadIdx.y][k] * Right_shared_t[k][threadIdx.x];
        }

        // Synchronize to ensure all threads have completed computation before reusing shared memory
        __syncthreads();
    }

    // Store result, ensure that threads do not write out of bounds
    if (row < dim && col < dim) {
        res[row * dim + col] = temp;
    }
}