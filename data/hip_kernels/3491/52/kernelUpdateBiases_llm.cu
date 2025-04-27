#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void kernelUpdateBiases(float *nabla_b, float *biases, float eta, float mini_batch_size) {
    // Calculate rate once outside the loop
    float rate = eta / mini_batch_size;

    // Use blockIdx and blockDim for scalability
    int idx = blockIdx.x * blockDim.x + threadIdx.x;

    if (idx < blockDim.x) { // Ensure within bounds
        biases[idx] -= rate * nabla_b[idx];
    }
}