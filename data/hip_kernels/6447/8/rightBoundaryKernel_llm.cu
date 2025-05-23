#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void rightBoundaryKernel(double* temperature, int block_size) {
    int j = blockDim.x * blockIdx.x + threadIdx.x;
    if (j < block_size) {
        // Optimize index calculation
        int index = (block_size + 2) * (1 + j) + (block_size + 1);
        temperature[index] = 1.0;
    }
}