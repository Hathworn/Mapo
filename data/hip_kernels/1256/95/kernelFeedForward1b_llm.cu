#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernelFeedForward1b(float *zs, int bound, float *weights, int w_off, float *activations) {

    int idx = (blockIdx.x * blockDim.x) + threadIdx.x;
    
    // Initialize zs for this thread
    float sum = 0.0f;
    
    // Use shared memory for activations to improve memory access efficiency
    __shared__ float shared_activations[256]; // Adjust size according to block size
    
    // Load activations to shared memory
    if (threadIdx.x < bound) {
        shared_activations[threadIdx.x] = activations[(blockIdx.x * bound) + threadIdx.x];
    }
    __syncthreads();
    
    // Computation using shared memory
    for (int i = 0; i < bound; i++) {
        sum += weights[w_off + (threadIdx.x * bound) + i] * shared_activations[i];
    }
    
    // Store result in global memory
    zs[idx] = sum;
}