#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernelBackprop1(float *delta_nabla_w, int w_off, float *activations, float *delta_nabla_b, int b_off) {
    // Optimize by using shared memory for activations and delta_nabla_b
    extern __shared__ float shared_mem[];
    float* s_activations = shared_mem;
    float* s_delta_nabla_b = &shared_mem[blockDim.x];

    // Load data into shared memory
    int tid = threadIdx.x;
    s_activations[tid] = activations[tid];
    s_delta_nabla_b[blockIdx.x] = delta_nabla_b[b_off + blockIdx.x];
    __syncthreads();

    // Perform computation using shared memory
    delta_nabla_w[w_off + (blockIdx.x * blockDim.x) + threadIdx.x] = s_activations[tid] * s_delta_nabla_b[blockIdx.x];
}