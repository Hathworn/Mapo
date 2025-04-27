#include "hip/hip_runtime.h"
#include "includes.h"

// Improved kernel with parallel reduction
__global__ void analyze(const float *input, float *sum, int numElements) {
    __shared__ float sharedSum[256]; // Allocate shared memory

    int tid = threadIdx.x;
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Each thread computes its element if within bounds
    if (i < numElements) {
        sharedSum[tid] = input[i];
    } else {
        sharedSum[tid] = 0.0f; // Initialize out of bounds threads with zero
    }

    // Synchronize threads to ensure all writes to shared memory are done
    __syncthreads();

    // Perform parallel reduction in shared memory
    for (int stride = blockDim.x / 2; stride > 0; stride /= 2) {
        if (tid < stride) {
            sharedSum[tid] += sharedSum[tid + stride];
        }
        __syncthreads();
    }

    // Write back result of reduction to global memory
    if (tid == 0) {
        atomicAdd(sum, sharedSum[0]); // Use atomic only for final sum
    }
}