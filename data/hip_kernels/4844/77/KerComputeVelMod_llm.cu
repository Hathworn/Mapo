#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void KerComputeVelMod(unsigned n, const float4 *vel, float *velmod)
{
    unsigned p = blockIdx.x * blockDim.x + threadIdx.x; // -Number of particle.
    if (p < n) {
        const float4 r = vel[p];
        // Compute velocity magnitude using inline computation
        velmod[p] = fmaf(r.x, r.x, fmaf(r.y, r.y, r.z * r.z));
    }
}