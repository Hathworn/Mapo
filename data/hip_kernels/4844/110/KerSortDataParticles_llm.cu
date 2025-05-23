#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void KerSortDataParticles(unsigned n, unsigned pini, const unsigned *sortpart, const float *a, float *a2)
{
    const unsigned p = blockIdx.x * blockDim.x + threadIdx.x; // Particle number.
    if (p < n) {
        const unsigned oldpos = (p < pini ? p : sortpart[p]);
        a2[p] = a[oldpos];
    }
}