#include "hip/hip_runtime.h"
#include "includes.h"

// Kernel function optimized for improved performance
__global__ void gpu_dotp_kernel(int size, float* vec1, float* vec2, float* res) {
    extern __shared__ float shared_cache[]; // Use shared memory
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    int tid = threadIdx.x; // Thread index

    shared_cache[tid] = (i < size) ? vec1[i] * vec2[i] : 0.0f; // Store partial results in shared memory
    __syncthreads(); // Synchronize threads within the block

    // Perform reduction in shared memory
    for (int stride = blockDim.x / 2; stride > 0; stride >>= 1) {
        if (tid < stride) {
            shared_cache[tid] += shared_cache[tid + stride];
        }
        __syncthreads(); // Ensure all additions are completed
    }

    // Store the result in global memory
    if (tid == 0) {
        atomicAdd(res, shared_cache[0]); // Add the block's result to global result
    }
}