#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void updateOutputWeights(float* d_weights, float error, float lr, int keypress, int numHiddenNeurons, float* outputTotals, int numInput) {
    int id = threadIdx.x + blockDim.x * blockIdx.x;

    // Calculate index only if id is valid
    if (id < numHiddenNeurons) {
        int index = numHiddenNeurons * keypress + id;

        // Calculate certainty in parallel using shared memory.
        __shared__ float shared_outputTotals[1024]; // Assume max numInput is 1024
        if (id < numInput) {
            shared_outputTotals[id] = outputTotals[id];
        }
        __syncthreads();

        float certainty = 0.0f;
        for (int i = 0; i < numInput; ++i) {
            certainty += shared_outputTotals[i];
        }
        certainty = shared_outputTotals[keypress] / certainty; // Reduce memory access

        // Calculate change and update weight
        float change = error * lr * d_weights[index] * certainty;
        d_weights[index] += change;

        // Clamp weights using fminf and fmaxf for efficiency
        d_weights[index] = fminf(1.0f, d_weights[index]);
        d_weights[index] = fmaxf(0.0f, d_weights[index]);
    }
}