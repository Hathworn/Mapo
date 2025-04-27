#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void scan(float * input, float * output, int len) {
    // Load into shared memory or zero if out of bounds
    __shared__ float scan_array[BLOCK_SIZE];
    int global_id = threadIdx.x + blockDim.x * blockIdx.x;
    scan_array[threadIdx.x] = (global_id < len) ? input[global_id] : 0;
    __syncthreads();

    // Up-sweep (reduce) phase
    for (int stride = 1; stride < BLOCK_SIZE; stride *= 2) {
        int index = (threadIdx.x + 1) * 2 * stride - 1;
        if (index < BLOCK_SIZE) scan_array[index] += scan_array[index - stride];
        __syncthreads();
    }

    // Down-sweep phase
    for (int stride = BLOCK_SIZE >> 1; stride > 0; stride >>= 1) {
        __syncthreads();
        int index = (threadIdx.x + 1) * 2 * stride - 1;
        if (index + stride < BLOCK_SIZE) scan_array[index + stride] += scan_array[index];
    }
    __syncthreads();

    // Write results to global memory
    if (global_id < len) output[global_id] = scan_array[threadIdx.x];

    // Handle boundary condition and carry over sums to next blocks
    if (threadIdx.x == 0) {
        float block_sum = scan_array[BLOCK_SIZE - 1];
        for (int block_idx = blockIdx.x + 1; block_idx < (len + BLOCK_SIZE - 1) / BLOCK_SIZE; ++block_idx) {
            int offset_global_id = block_idx * BLOCK_SIZE + threadIdx.x;
            if (offset_global_id < len) output[offset_global_id] += block_sum;
            __syncthreads();
        }
    }
}