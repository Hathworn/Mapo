#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void kernBlockWiseMax(const size_t numPoints, double* dest) {
// Assumes a 2D grid of 1024x1 1D blocks
int b = blockIdx.y * gridDim.x + blockIdx.x;
int i = b * blockDim.x + threadIdx.x;

__shared__ double blockMax[1024];

// Initialize shared memory with a check to avoid out of bounds
blockMax[threadIdx.x] = (i < numPoints) ? dest[i] : -INFINITY;

__syncthreads();

// Use single loop with half sized step optimization
for(int s = blockDim.x / 2; s > 0; s >>= 1) {
    if(threadIdx.x < s && blockMax[threadIdx.x] < blockMax[threadIdx.x + s]) {
        blockMax[threadIdx.x] = blockMax[threadIdx.x + s];
    }
    __syncthreads();
}

if(threadIdx.x == 0) {
// Just do one global write
dest[b] = blockMax[0];
}
}