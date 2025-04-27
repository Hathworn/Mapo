#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernelBackprop1(float *delta_nabla_w, int w_off, float *activations, float *delta_nabla_b, int b_off) {
    // Use a single index for both block and thread for better memory coalescing
    int index = blockIdx.x * blockDim.x + threadIdx.x;
    delta_nabla_w[w_off + index] = activations[threadIdx.x] * delta_nabla_b[b_off + blockIdx.x];
}