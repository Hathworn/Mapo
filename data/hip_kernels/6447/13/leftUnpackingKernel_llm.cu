#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void leftUnpackingKernel(double* temperature, double* ghost, int block_size) {
    // Calculate the global id for the thread
    int j = blockDim.x * blockIdx.x + threadIdx.x;

    // Use if condition inside the loop to ensure all threads hit the condition check
    if (j < block_size) {
        // Load ghost value into the temperature array
        temperature[(block_size + 2) * (1 + j) + 1] = ghost[j];
    }
}