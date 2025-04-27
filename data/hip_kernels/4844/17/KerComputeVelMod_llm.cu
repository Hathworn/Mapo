#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void KerComputeVelMod(unsigned n, const float4 *vel, float *velmod)
{
    unsigned p = blockIdx.x * blockDim.x + threadIdx.x; // Calculate particle index
    if(p < n)
    {
        const float4 r = vel[p];
        // using intrinsic function to compute dot product for efficiency
        velmod[p] = __dot3f(r, r); 
    }
}