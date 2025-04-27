#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void vecAdd(float* __restrict__ C, const float* __restrict__ A, const float* __restrict__ B, int n) {
    // Use shared memory for better efficiency
    extern __shared__ float sharedMemory[];

    // Get our global thread ID
    int id = blockIdx.x * blockDim.x + threadIdx.x;
    int tid = threadIdx.x;

    // Make sure we do not go out of bounds
    if (id < n) {
        // Load data into shared memory
        sharedMemory[tid] = A[id];
        __syncthreads(); // Synchronize to ensure all data is loaded

        // Perform vector addition
        C[id] = sharedMemory[tid] + B[id];
    }
}