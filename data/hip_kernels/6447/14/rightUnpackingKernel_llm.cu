#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void rightUnpackingKernel(double* temperature, double* ghost, int block_size) {
    int j = blockIdx.x * blockDim.x + threadIdx.x;
    // Use shared memory when possible to reduce repetitive global memory access
    __shared__ double local_ghost[256]; // assuming max blockDim.x is 256

    if (j < block_size) {
        // Load data from global memory to shared memory
        local_ghost[threadIdx.x] = ghost[j];
    }

    __syncthreads(); // Ensure all threads have loaded their values

    if (j < block_size) {
        // Perform the unpacking using shared memory
        temperature[(block_size + 2) * (1 + j) + block_size] = local_ghost[threadIdx.x];
    }
}