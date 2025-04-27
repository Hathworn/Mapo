#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cudaising(int* G, double* w, int* newG) {
    int index = threadIdx.x + blockIdx.x * blockDim.x;
    double newSpin = 0.0;
    
    // Using shared memory for faster access to w
    __shared__ double shared_w[25];
    int tx = threadIdx.x;
    
    if (tx < 25) {
        shared_w[tx] = w[tx];
    }
    __syncthreads();
    
    // Improved loop access
    int halfDim = blockDim.x / 2;
    int xOffset = threadIdx.x + blockDim.x;
    int blockOffset = blockIdx.x + blockDim.x;
    
    for (int ii = -2; ii <= 2; ii++) {
        for (int jj = -2; jj <= 2; jj++) {
            // Pre-compute indexes for efficiency
            int wIndex = (jj + 2) + (ii + 2) * 5;
            int gIndex = ((jj + xOffset) % blockDim.x) + ((blockOffset + ii) % blockDim.x) * blockDim.x;
            newSpin += shared_w[wIndex] * G[gIndex];
        }
    }
    
    // Optimize conditions - avoiding multiple comparisons
    if (newSpin > 0.000001) {
        newG[index] = 1;
    } else if (newSpin < -0.000001) {
        newG[index] = -1;
    } else {
        newG[index] = G[index];
    }
}