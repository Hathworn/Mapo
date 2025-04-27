#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void attentionKernel(float *x, int rows, int cols) {
    int j = blockIdx.x * blockDim.x + threadIdx.x;

    if (j >= cols) return;

    float sum = 0;
    
    // Use shared memory to reduce global memory access
    extern __shared__ float sharedSum[];
    
    // Step 1: Calculate sum
    for (int k = 0; k < rows; k++) {
        sum += x[k * cols + j];
    }

    // Write sum to shared memory
    sharedSum[threadIdx.x] = sum;
    __syncthreads();

    // Read sum from shared memory reducing calculation overhead
    sum = sharedSum[threadIdx.x];

    // Step 2: Update x using computed sum
    for (int k = 0; k < rows; k++) {
        x[k * cols + j] *= sum;
    }
}