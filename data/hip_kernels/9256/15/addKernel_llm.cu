#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void addKernel(float* A, float* B, float* C, int numberIterations, int size) {

    // Calculate global thread index
    int globalIndex = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Compute starting index for this thread
    int start = globalIndex * numberIterations;
    
    // Use shared memory for a section of A and B
    extern __shared__ float sharedMem[];
    float* sharedA = sharedMem;
    float* sharedB = sharedMem + blockDim.x * numberIterations;

    // Load data into shared memory
    for (int i = 0; i < numberIterations && (start + i) < size; ++i) {
        int idx = start + i;
        sharedA[threadIdx.x * numberIterations + i] = A[idx];
        sharedB[threadIdx.x * numberIterations + i] = B[idx];
    }

    // Synchronize to make sure data is loaded before using it
    __syncthreads();
    
    // Perform addition
    for (int i = 0; i < numberIterations && (start + i) < size; ++i) {
        int idx = start + i;
        C[idx] = sharedA[threadIdx.x * numberIterations + i] + sharedB[threadIdx.x * numberIterations + i];
    }
}