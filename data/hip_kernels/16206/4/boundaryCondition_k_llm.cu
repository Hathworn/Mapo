#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void boundaryCondition_k(float* payoff, size_t spotSize, float strike) {
    size_t state_idx = threadIdx.x; // Get the thread index
    size_t index = state_idx * spotSize; // Compute base index for thread
    payoff[spotSize - 1 + index] = 2 * strike; // Set payoff for max spot
    payoff[index] = 0.0; // Set payoff for min spot
}