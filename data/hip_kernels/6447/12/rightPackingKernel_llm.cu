#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void rightPackingKernel(double* temperature, double* ghost, int block_size) {
    int j = blockDim.x * blockIdx.x + threadIdx.x;

    // Use shared memory for improved access speed within block
    extern __shared__ double shared_temp[];

    // Load data into shared memory if within bounds
    if (j < block_size) {
        shared_temp[threadIdx.x] = temperature[(block_size + 2) * (1 + j) + block_size];
    }

    // Ensure all threads have loaded their data
    __syncthreads();

    // Write data from shared memory to ghost array
    if (j < block_size) {
        ghost[j] = shared_temp[threadIdx.x];
    }
}