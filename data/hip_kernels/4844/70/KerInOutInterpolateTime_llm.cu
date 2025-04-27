#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void KerInOutInterpolateTime(unsigned npt, double fxtime, const float *vel0, const float *vel1, float *vel)
{
    unsigned p = blockIdx.x * blockDim.x + threadIdx.x;
    // Ensure thread processes only valid particles
    if (p < npt) {
        float v0 = vel0[p];
        float v1 = vel1[p];
        // Interpolate velocity
        vel[p] = fxtime * (v1 - v0) + v0;
    }
}