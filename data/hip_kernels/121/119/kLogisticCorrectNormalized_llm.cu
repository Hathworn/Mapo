#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kLogisticCorrectNormalized(float* mat, float* targets, float* out, unsigned int height, unsigned int width) {
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure the thread index is within bounds
    if (idx < height) {
        float correct = 0;
        float total = 0;
        float p, t;

        // Use shared memory for coalesced memory access
        extern __shared__ float shared[];

        // Load data into shared memory
        for (int i = idx; i < width * height; i += height) {
            shared[threadIdx.x] = mat[i];
            __syncthreads();
            
            p = shared[threadIdx.x];
            t = targets[i];

            correct += (t < 0) ? 0 : (((t >= 0.5 && p >= 0.5) || (t < 0.5 && p < 0.5)) ? 1: 0);
            total += (t < 0) ? 0 : 1;
            __syncthreads();
        }

        // Store the result
        out[idx] = (total > 0) ? (correct / total) : 0;
    }
}