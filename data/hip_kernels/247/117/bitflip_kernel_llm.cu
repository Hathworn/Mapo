#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void bitflip_kernel(float* M, int height, int row, int n) {
    // Use shared memory and load coalesced for optimization
    extern __shared__ float shared_M[];
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    const unsigned int stride = blockDim.x * gridDim.x;
    
    for (unsigned int i = idx; i < n; i += stride) {
        // Load data into shared memory for better memory access patterns
        shared_M[threadIdx.x] = M[i * height + row];
        __syncthreads();

        // Bitflipping the value
        shared_M[threadIdx.x] = 1 - shared_M[threadIdx.x];
        __syncthreads();

        // Write back to global memory
        M[i * height + row] = shared_M[threadIdx.x];
    }
}