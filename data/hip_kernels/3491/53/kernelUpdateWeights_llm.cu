#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernelUpdateWeights(float *nabla_w, float *weights, int tws, float eta, float mini_batch_size) {
    // Calculate rate outside the if statement, storing it in shared memory for efficient access.
    __shared__ float rate;
    if (threadIdx.x == 0) {
        rate = eta / mini_batch_size;
    }
    __syncthreads(); // Synchronize to ensure all threads have access to 'rate'.

    // Use a single calculation for the index.
    int index = blockIdx.x * blockDim.x + threadIdx.x;

    if (index < tws) {
        // Use the pre-computed rate and index.
        weights[index] -= rate * nabla_w[index];
    }
}