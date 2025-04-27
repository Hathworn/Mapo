#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernelFeedForward1b(float *zs, int bound, float *weights, int w_off, float *activations) {
    int idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Initialize output value for each thread
    float sum = 0.0f;
    
    // Use shared memory to improve memory access patterns (for inputs, if applicable) 
    extern __shared__ float shared_activations[];
    for (int i = threadIdx.x; i < bound; i += blockDim.x) {
        shared_activations[i] = activations[blockIdx.x * bound + i];
    }
    __syncthreads();

    // Compute the dot product
    for (int i = 0; i < bound; i++) {
        sum += weights[w_off + (threadIdx.x * bound) + i] * shared_activations[i];
    }
    
    // Store the result
    zs[idx] = sum;
}