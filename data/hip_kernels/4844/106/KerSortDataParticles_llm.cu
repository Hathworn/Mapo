#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void KerSortDataParticles(unsigned n, unsigned pini, const unsigned *sortpart, const float *a, const float *b, float *a2, float *b2)
{
    const unsigned p = blockIdx.x * blockDim.x + threadIdx.x; // Compute particle index
    if (p < n) {
        const unsigned oldpos = (p < pini ? p : sortpart[p]); // Determine original position of the particle
        a2[p] = a[oldpos];
        b2[p] = b[oldpos];
    }
}