#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernelUpdateBiases(float *nabla_b, float *biases, float eta, float mini_batch_size) {
    // Compute rate once outside the loop for efficiency
    float rate = eta / mini_batch_size;

    // Using blockIdx.x and blockDim.x for potential multi-block operations
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Check if index is within bounds
    if (idx < blockDim.x) {
        biases[idx] -= rate * nabla_b[idx];
    }
}