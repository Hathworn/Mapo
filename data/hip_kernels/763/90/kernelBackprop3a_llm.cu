#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void kernelBackprop3a(float *delta_nabla_b, int b_off, int bound, int b_off_old, float *weights, int w_off_old) {

    // Cache the delta_nabla_b value in a register for faster access
    float delta_nb = delta_nabla_b[b_off + threadIdx.x];
    
    // Initialize the register
    delta_nb = 0.0;

    for (int j = 0; j < bound; j++) {
        // Calculate the weights index once outside the for loop to reduce redundant computation
        int weight_idx = w_off_old + (j * blockDim.x) + threadIdx.x;
        
        // Accumulate directly into the register
        delta_nb += delta_nabla_b[b_off_old + j] * weights[weight_idx];
    }

    // Write the computed value back to global memory
    delta_nabla_b[b_off + threadIdx.x] = delta_nb;
}