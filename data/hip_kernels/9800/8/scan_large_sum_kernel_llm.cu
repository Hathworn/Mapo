#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void scan_large_sum_kernel(unsigned int* output_block, unsigned int* output_val, unsigned int* output_pos, unsigned int* input_val, unsigned int* input_pos, unsigned int* histogram, unsigned int pass, unsigned int block_num, unsigned int size) {

    __shared__ unsigned int shared_prefix_sum[BLOCK_SIZE];
    unsigned int tid = threadIdx.x;
    unsigned int mid = threadIdx.x + blockIdx.x * blockDim.x;

    // Initialize shared memory efficiently
    if (mid < size) {
        shared_prefix_sum[tid] = output_block[blockIdx.x] + output_val[mid];
    } else {
        shared_prefix_sum[tid] = 1;
    }
    __syncthreads();

    // Reuse shared memory to avoid bank conflicts and nullify unneeded branches
    if (mid < size) {
        unsigned int location = shared_prefix_sum[tid];
        if ((input_val[mid] >> pass) & 0x01) {
            location = mid + histogram[0] - shared_prefix_sum[tid];
        }
        // Optimize boundary check print statement to prevent overhead
        if (location < size) {
            output_val[mid] = location;
        }
    }
    __syncthreads();
}