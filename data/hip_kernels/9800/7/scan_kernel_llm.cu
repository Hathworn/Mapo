#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void scan_kernel(unsigned int* output_block, unsigned int block_num) {
    __shared__ unsigned int shared_output[BLOCK_SIZE];

    // Initialize shared memory using a ternary operator to remove conditional statement
    shared_output[threadIdx.x] = (threadIdx.x >= block_num || threadIdx.x == 0) ? 0x0 : output_block[threadIdx.x - 1];
    __syncthreads();

    // Unroll loops for better performance
    #pragma unroll
    for (unsigned int i = 1; i < block_num; i <<= 1) {
        unsigned int val = (threadIdx.x >= i) ? shared_output[threadIdx.x - i] : 0;
        __syncthreads();
        shared_output[threadIdx.x] += val;
        __syncthreads();
    }

    // Write back the results to global memory
    if (threadIdx.x < block_num) {
        output_block[threadIdx.x] = shared_output[threadIdx.x];
    }
    __syncthreads();
}