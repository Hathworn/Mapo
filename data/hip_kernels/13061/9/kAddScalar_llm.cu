#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kAddScalar(float* gData, float scalar, float* target, unsigned int numElements) {
    // Calculate the global thread index
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x; 
    
    // Use shared memory to improve memory access patterns
    __shared__ float sharedData[256]; // Example size, adjust as needed

    // Load data into shared memory
    if (idx < numElements) {
        sharedData[threadIdx.x] = gData[idx];
    }

    // Ensure all threads have loaded their data
    __syncthreads();

    // Perform computation and store result
    if (idx < numElements) {
        target[idx] = scalar + sharedData[threadIdx.x];
    }
}