#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernelBackprop3a(float *delta_nabla_b, int b_off, int bound, int b_off_old, float *weights, int w_off_old) {

    int tid = blockIdx.x * blockDim.x + threadIdx.x; // Calculate global thread ID

    if (tid < blockDim.x) { // Ensure we don't access out of bounds
        float temp = 0.0f; // Local variable for accumulation
        for (int j = 0; j < bound; j++) {
            // Accumulate with stride for coalesced memory access
            temp += delta_nabla_b[b_off_old + j] * weights[w_off_old + (j * blockDim.x) + tid];
        }
        delta_nabla_b[b_off + tid] = temp; // Write result back to global memory
    }
}