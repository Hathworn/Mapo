#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kEqualsScalar(float* __restrict__ mat, float val, float* __restrict__ target, unsigned int len) {
    // Calculate the thread's unique index in the grid
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Utilize shared memory to enhance memory access speed (assuming small block sizes and data fits)
    extern __shared__ float shared_mat[];
    
    // Check if index is within bounds
    if (idx < len) {
        // Load mat into shared memory
        shared_mat[threadIdx.x] = mat[idx];
        __syncthreads();
        
        // Perform computation
        target[idx] = shared_mat[threadIdx.x] == val;
    }
}