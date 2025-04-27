#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cumulativeOffspringToAncestorKernel(const int* cumulativeOffspring, int* ancestor, int numParticles) {
    int idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure idx is within valid range
    if (idx >= numParticles) return;
    
    // Compute start and number of offspring for current thread
    int start = idx == 0 ? 0 : cumulativeOffspring[idx - 1];
    int numCurrentOffspring = cumulativeOffspring[idx] - start;

    // Optimize by using parallel threads to update the ancestor array
    for (int j = threadIdx.x; j < numCurrentOffspring; j += blockDim.x) {
        ancestor[start + j] = idx;
    }
}