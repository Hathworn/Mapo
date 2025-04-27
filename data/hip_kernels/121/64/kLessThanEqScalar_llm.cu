#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized kernel function
__global__ void kLessThanEqScalar(float* __restrict__ mat, float val, float* __restrict__ target, unsigned int len) {
    // Use cache-friendly shared memory to improve performance
    extern __shared__ float shared_mem[];
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    const unsigned int stride = blockDim.x * gridDim.x;
    
    for (unsigned int i = idx; i < len; i += stride) {
        shared_mem[threadIdx.x] = mat[i];
        __syncthreads(); // Ensure all threads have written to shared memory
        target[i] = shared_mem[threadIdx.x] <= val; // Use shared memory result
    }
}