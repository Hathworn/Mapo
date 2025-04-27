#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void topBoundaryKernel(double* temperature, int block_size) {
    int i = blockDim.x * blockIdx.x + threadIdx.x;
    if (i < block_size) {
        // Use shared memory to reduce global memory access
        __shared__ double temp_cache[BLOCK_SIZE];
        temp_cache[threadIdx.x] = 1.0;
        __syncthreads();
        
        // Write back to global memory
        temperature[1 + i] = temp_cache[threadIdx.x];
    }
}