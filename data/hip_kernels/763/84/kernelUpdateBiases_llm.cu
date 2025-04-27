#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernelUpdateBiases(float *nabla_b, float *biases, float eta, float mini_batch_size) {
    // Compute rate once and use it for all threads to improve efficiency
    float rate = eta / mini_batch_size;
    int index = threadIdx.x + blockIdx.x * blockDim.x;
    biases[index] -= rate * nabla_b[index]; // Utilize blockIdx for accessing elements beyond blockDim.x
}