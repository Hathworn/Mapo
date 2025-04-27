#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void KerSortDataParticles(unsigned n, unsigned pini, const unsigned *sortpart, const float *a, float *a2) {
    const unsigned p = blockIdx.x * blockDim.x + threadIdx.x; // Particle number
    if (p < n) {
        unsigned oldpos = sortpart[p]; // Fetching values without the condition
        if (p < pini) oldpos = p; // Inline replacement for conditional assignment
        a2[p] = a[oldpos];
    }
}