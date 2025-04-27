#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void initKernel(double* temperature, int block_size) {
    // Calculate 1D thread index to enhance memory access pattern
    int index = (blockDim.x * gridDim.x) * (threadIdx.y + blockIdx.y * blockDim.y) + (threadIdx.x + blockIdx.x * blockDim.x);
    int total_size = (block_size + 2) * (block_size + 2);

    if (index < total_size) { // Flatten the 2D grid into 1D index for boundary checking
        temperature[index] = 0.0;
    }
}