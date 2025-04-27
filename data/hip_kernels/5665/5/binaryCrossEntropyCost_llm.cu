#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void binaryCrossEntropyCost(float* cost, float* predictions, float* target, int size) {
    // Calculate global thread index
    int index = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Check if index is within bounds
    if (index < size) {
        // Compute partial cost in registers for efficiency
        float pred = predictions[index];
        float tar = target[index];
        float partial_cost = tar * logf(1.0e-15 + pred) + (1.0f - tar) * logf(1.0e-15 + (1.0f - pred));
        
        // Atomic addition to avoid race conditions
        atomicAdd(cost, -partial_cost / size);
    }
}