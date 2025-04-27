#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void calculate_entropy(float *norm, float *entropy, int max, float sum, int size) {
    // Calculate global thread index
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = blockDim.x * gridDim.x;

    // Initialize shared memory
    extern __shared__ float shared_entropy[];

    float local_entropy = 0.0f;
    
    // Calculate entropy contribution for each thread's portion of the array
    while (idx < size) {
        if (norm[idx] != 0) {
            local_entropy -= norm[idx] * log10f(norm[idx]);
        }
        idx += stride;
    }

    // Store each thread's partial result into shared memory
    int tid = threadIdx.x;
    shared_entropy[tid] = local_entropy;
    __syncthreads();

    // Perform reduction in shared memory
    for (int s = blockDim.x / 2; s > 0; s >>= 1) {
        if (tid < s) {
            shared_entropy[tid] += shared_entropy[tid + s];
        }
        __syncthreads();
    }

    // Add the block's result to the global memory
    if (tid == 0) {
        atomicAdd(&entropy[0], shared_entropy[0]);
    }

    // Print final entropy result from one thread
    if (blockIdx.x == 0 && threadIdx.x == 0) {
        printf("entropy %f\n", entropy[0]);
    }
}