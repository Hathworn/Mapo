#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void kernel_calculate_sum(double * dev_array_sums, unsigned int array_size, double * dev_block_sums) {

    // Declare shared memory using automatic memory allocation for the block
    extern __shared__ double shared_sum[];

    unsigned int tid = threadIdx.x;
    unsigned int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Efficient global to shared memory transfer
    if (i < array_size) {
        shared_sum[tid] = dev_array_sums[i];
    } else {
        shared_sum[tid] = 0.0; // Ensure to initialize with floating-point literal
    }
    __syncthreads(); // Synchronize threads

    // Use warp-level reduction when threads per block is below 32
    for (unsigned int s = blockDim.x / 2; s > 0; s >>= 1) {
        if (tid < s) {
            shared_sum[tid] += shared_sum[tid + s];
        }
        __syncthreads(); // Synchronize threads
    }

    // Store block result to global memory
    if (tid == 0) {
        dev_block_sums[blockIdx.x] = shared_sum[0];
    }
}