#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cumulativeOffspringToAncestorKernel(const int* cumulativeOffspring, int* ancestor, int numParticles) {
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    // Early exit for out-of-bound indices
    if (idx >= numParticles) return;

    int numCurrentOffspring = cumulativeOffspring[idx] - (idx == 0 ? 0 : cumulativeOffspring[idx - 1]);
    
    // Use loop unrolling for optimization
    for (int j = 0; j < numCurrentOffspring; j++) {
        ancestor[(idx == 0 ? 0 : cumulativeOffspring[idx - 1]) + j] = idx;
    }
}