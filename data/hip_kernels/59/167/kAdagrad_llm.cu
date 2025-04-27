#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kAdagrad(float *history, float *grad, float delta, int len) {
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    const unsigned int numThreads = blockDim.x * gridDim.x;

    // Use shared memory for faster square root computation
    extern __shared__ float shared_grad[];

    for (unsigned int i = idx; i < len; i += numThreads) {
        float curr_norm = history[i] - delta;
        shared_grad[threadIdx.x] = grad[i];
        __syncthreads();  // Ensure all threads have loaded data

        history[i] = delta + sqrtf(curr_norm * curr_norm + shared_grad[threadIdx.x] * shared_grad[threadIdx.x]);
        __syncthreads();  // Ensure all threads have finished writing to history
    }
}