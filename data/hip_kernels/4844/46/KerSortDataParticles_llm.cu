#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void KerSortDataParticles(unsigned n, unsigned pini, const unsigned *sortpart, const float *a, const float *b, float *a2, float *b2)
{
    unsigned p = blockIdx.x * blockDim.x + threadIdx.x; // Calculate particle number
    if (p < n) {
        unsigned oldpos = (p < pini) ? p : sortpart[p]; // Determine old position
        a2[p] = a[oldpos];
        b2[p] = b[oldpos];
    }
}