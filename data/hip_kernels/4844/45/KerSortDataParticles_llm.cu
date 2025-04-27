#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void KerSortDataParticles(unsigned n, unsigned pini, const unsigned *sortpart, const float4 *a, float4 *a2)
{
    unsigned p = blockIdx.x * blockDim.x + threadIdx.x; // Particle index
    if (p < n) {
        unsigned oldpos = (p < pini ? p : sortpart[p]);
        a2[p] = a[oldpos]; // Assign sorted data
    }
}