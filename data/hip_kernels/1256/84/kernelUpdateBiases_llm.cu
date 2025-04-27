#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void kernelUpdateBiases(float *nabla_b, float *biases, float eta, float mini_batch_size) {
    // Calculate learning rate once per block
    float rate = eta / mini_batch_size;
    
    // Use blockDim.x to support larger workloads
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Check if idx is within bounds
    if (idx < blockDim.x) {
        biases[idx] -= rate * nabla_b[idx];
    }
}