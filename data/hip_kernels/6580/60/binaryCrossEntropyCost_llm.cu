#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void binaryCrossEntropyCost(float* predictions, float* target, int size, float* cost) {

    int index = blockIdx.x * blockDim.x + threadIdx.x;

    // Each thread computes its own contribution to the cost
    if (index < size) {
        float pred = predictions[index];
        float tgt = target[index];
        
        // Reduce number of computations by storing shared operations
        float log_pred = logf(pred);
        float log_one_minus_pred = logf(1.0f - pred);
        
        float partial_cost = tgt * log_pred + (1.0f - tgt) * log_one_minus_pred;
        
        // Use atomic operations to sum the contributions of all threads
        atomicAdd(cost, - partial_cost / size);
    }
}