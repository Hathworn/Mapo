#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void KerSortDataParticles(unsigned n, unsigned pini, const unsigned *sortpart, const float3 *a, float3 *a2) 
{
    unsigned p = blockIdx.x * blockDim.x + threadIdx.x; // Calculate global thread index
    if (p < n) {
        unsigned oldpos = (p < pini ? p : sortpart[p]);
        a2[p] = a[oldpos];
    }
}