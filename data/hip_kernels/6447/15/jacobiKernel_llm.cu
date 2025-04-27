#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void jacobiKernel(double* temperature, double* new_temperature, int block_size) {
    // Calculate the global thread indices
    int i = (blockDim.x * blockIdx.x + threadIdx.x) + 1;
    int j = (blockDim.y * blockIdx.y + threadIdx.y) + 1;
    
    // Check bounds and perform the computation
    if (i <= block_size && j <= block_size) {
        int index = j * (block_size + 2) + i; // Precomputing to avoid redundant calculations
        int left = index - 1;
        int right = index + 1;
        int up = index - (block_size + 2);
        int down = index + (block_size + 2);

        // Calculate new temperature value
        new_temperature[index] = (
            temperature[left] +
            temperature[right] +
            temperature[up] +
            temperature[down] +
            temperature[index]
        ) * DIVIDEBY5; // Use of constant to avoid magic numbers
    }
}