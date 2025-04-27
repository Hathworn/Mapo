#include "hip/hip_runtime.h"
#include "includes.h"

// Optimize the global kernel function
__global__ void leftPackingKernel(double* temperature, double* ghost, int block_size) {
    int j = blockDim.x * blockIdx.x + threadIdx.x;

    // Ensure all threads that write into ghost array are within bounds
    if (j < block_size) {
        int idx = (block_size + 2) * (1 + j) + 1;  // Precompute repeated index calculation
        ghost[j] = temperature[idx];
    }
}