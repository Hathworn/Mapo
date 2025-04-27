#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernelBackprop3a(float *delta_nabla_b, int b_off, int bound, int b_off_old, float *weights, int w_off_old) {
    // Use shared memory to cache weights
    extern __shared__ float shared_weights[];
    int thread_id = threadIdx.x; // Cache thread index
    int global_idx = b_off + thread_id; // Calculate global index
    
    delta_nabla_b[global_idx] = 0.0;
    for (int j = 0; j < bound; j++) {
        // Load weights to shared memory
        shared_weights[thread_id] = weights[w_off_old + (j * blockDim.x) + thread_id];
        __syncthreads(); // Ensure all weights are loaded
        
        // Compute delta_nabla_b using cached weights
        delta_nabla_b[global_idx] += delta_nabla_b[b_off_old + j] * shared_weights[thread_id];
        __syncthreads(); // Synchronize threads to ensure correct computation
    }
}