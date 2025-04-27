#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernelBackprop3a(float *delta_nabla_b, int b_off, int bound, int b_off_old, float *weights, int w_off_old) {
    // Calculate the index for the current thread
    int idx = blockDim.x * blockIdx.x + threadIdx.x;

    // Initialize shared memory for the reduction
    extern __shared__ float shared_mem[];

    // Initialize delta_nabla_b for the current thread
    float sum = 0.0f;

    // Use a loop unrolling technique for performance improvement
    for (int j = 0; j < bound; j += 4) {
        if (j < bound) sum += delta_nabla_b[b_off_old + j] * weights[w_off_old + (j * blockDim.x) + threadIdx.x];
        if (j + 1 < bound) sum += delta_nabla_b[b_off_old + j + 1] * weights[w_off_old + ((j + 1) * blockDim.x) + threadIdx.x];
        if (j + 2 < bound) sum += delta_nabla_b[b_off_old + j + 2] * weights[w_off_old + ((j + 2) * blockDim.x) + threadIdx.x];
        if (j + 3 < bound) sum += delta_nabla_b[b_off_old + j + 3] * weights[w_off_old + ((j + 3) * blockDim.x) + threadIdx.x];
    }

    // Write result back to global memory
    delta_nabla_b[b_off + idx] = sum;
}