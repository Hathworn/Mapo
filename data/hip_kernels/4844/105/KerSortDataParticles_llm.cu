#include "hip/hip_runtime.h"
#include "includes.h"

// Optimize kernel function for sorting data particles
__global__ void KerSortDataParticles(unsigned n, unsigned pini, const unsigned *sortpart, const float4 *a, float4 *a2)
{
    unsigned p = blockIdx.x * blockDim.x + threadIdx.x; // Global particle index
    if (p < n) {
        unsigned oldpos = (p < pini) ? p : sortpart[p]; // Calculate old position
        a2[p] = __ldg(&a[oldpos]); // Use __ldg for read-only cache load
    }
}