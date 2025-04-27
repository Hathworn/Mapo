#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void kSqSumColumnwise(float* mat, float* target, unsigned int width, unsigned int height) {
    __shared__ float sum_vals[32];
    float cur_sum = 0;
    
    // Compute start index for the row
    unsigned int start_index = blockIdx.x * height + threadIdx.x;
    
    // Improved loop increment to ensure consistent accumulation across threads
    for (unsigned int i = start_index; i < blockIdx.x * height + height; i += blockDim.x) {
        cur_sum += mat[i] * mat[i];
    }

    // Store partial results in shared memory
    sum_vals[threadIdx.x] = cur_sum;
    
    __syncthreads();
    
    // Reduce within the block threads
    if (threadIdx.x < 16) {
        sum_vals[threadIdx.x] += sum_vals[threadIdx.x + 16];
    }
    __syncthreads();
    if (threadIdx.x < 8) {
        sum_vals[threadIdx.x] += sum_vals[threadIdx.x + 8];
    }
    __syncthreads();
    if (threadIdx.x < 4) {
        sum_vals[threadIdx.x] += sum_vals[threadIdx.x + 4];
    }
    __syncthreads();
    if (threadIdx.x < 2) {
        sum_vals[threadIdx.x] += sum_vals[threadIdx.x + 2];
    }
    __syncthreads();
    if (threadIdx.x == 0) {
        sum_vals[0] += sum_vals[1];
        target[blockIdx.x] = sum_vals[0];
    }
}