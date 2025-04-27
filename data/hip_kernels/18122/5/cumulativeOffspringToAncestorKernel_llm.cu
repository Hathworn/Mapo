#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cumulativeOffspringToAncestorKernel(const int* cumulativeOffspring, int* ancestor, int numParticles) {
    int idx = blockIdx.x * blockDim.x + threadIdx.x;

    if (idx >= numParticles) return; // Simplified boundary check

    // Use global memory efficiently by removing redundant access
    int start = (idx == 0) ? 0 : cumulativeOffspring[idx - 1];
    int numCurrentOffspring = cumulativeOffspring[idx] - start;

    for (int j = 0; j < numCurrentOffspring; j++) {
        ancestor[start + j] = idx;
    }
}