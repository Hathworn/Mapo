#include "hip/hip_runtime.h"
#include "includes.h"

// Use a defined constant for the block size
#define BLOCK_SIZE 32

__global__ void kNormLimitColumnwise(float* mat, float* target, float norm, unsigned int width, unsigned int height) {
    // Use the shared memory only up to needed index
    __shared__ float sum_vals[BLOCK_SIZE + 1];

    float cur_sum = 0.0f;

    // Use block size constant
    for (unsigned int i = threadIdx.x; i < height; i += BLOCK_SIZE) {
        float val = mat[blockIdx.x * height + i];
        cur_sum += val * val;
    }
    sum_vals[threadIdx.x] = cur_sum;

    __syncthreads();

    // Unroll the loop for performance improvement
    if (threadIdx.x == 0) {
        cur_sum = 0.0f;
        for (unsigned int i = 0; i < BLOCK_SIZE; i += 4) {
            cur_sum += sum_vals[i];
            cur_sum += sum_vals[i + 1];
            cur_sum += sum_vals[i + 2];
            cur_sum += sum_vals[i + 3];
        }
        // Minimize synchronization points
        sum_vals[BLOCK_SIZE] = norm > cur_sum ? 1.0f : norm / sqrt(cur_sum);
    }

    __syncthreads();

    float scale = sum_vals[BLOCK_SIZE];

    for (unsigned int i = threadIdx.x; i < height; i += BLOCK_SIZE) {
        target[blockIdx.x * height + i] = mat[blockIdx.x * height + i] * scale;
    }
}