#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void KerSortDataParticles(unsigned n, unsigned pini, const unsigned *sortpart, const double2 *a, const double *b, const float4 *c, double2 *a2, double *b2, float4 *c2)
{
    unsigned p = blockIdx.x * blockDim.x + threadIdx.x;
    if (p < n) {
        unsigned oldpos = (p < pini ? p : sortpart[p]);
        // Cache read from global memory into registers
        double2 a_val = a[oldpos];
        double b_val = b[oldpos];
        float4 c_val = c[oldpos];

        // Write back to global memory
        a2[p] = a_val;
        b2[p] = b_val;
        c2[p] = c_val;
    }
}