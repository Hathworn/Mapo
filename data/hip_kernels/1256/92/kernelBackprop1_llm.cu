#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernelBackprop1(float *delta_nabla_w, int w_off, float *activations, float *delta_nabla_b, int b_off) {
    int idx = blockIdx.x * blockDim.x + threadIdx.x; // Compute global index

    // Efficient memory access pattern
    delta_nabla_w[w_off + idx] = activations[threadIdx.x] * delta_nabla_b[b_off + blockIdx.x];
}