#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void attentionKernel(float *x, int rows, int cols) {
    int j = blockIdx.x * blockDim.x + threadIdx.x;

    if (j >= cols) return;
    
    // Use shared memory to store partial sums
    extern __shared__ float sharedSum[];
    sharedSum[threadIdx.x] = 0;

    // Calculate sums using shared memory
    for (int k = 0; k < rows; k++) {
        sharedSum[threadIdx.x] += x[k * cols + j];
    }
    
    // Wait for all threads to calculate their partial sums
    __syncthreads();
    
    // Each thread multiplier by its own sum for simplicity
    float sum = sharedSum[threadIdx.x];
    
    // Multiply using computed sums
    for (int k = 0; k < rows; k++) {
        x[k * cols + j] *= sum;
    }
}