#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void precalculateABC(float4* ABCm, float* M, float timestep, float alpha, unsigned int numPoints)
{
    int me_idx = blockIdx.x * blockDim.x + threadIdx.x;

    if (me_idx >= numPoints)
        return;

    float twodelta = timestep * 2.0f;
    float deltasqr = timestep * timestep;

    // Use registers to minimize repeated global memory access
    float Mii = M[me_idx];
    float Dii = alpha * Mii; 

    float invDelta = 1.0f / deltasqr;  // Pre-calculate to reduce division operations
    float invTwodelta = 1.0f / twodelta;

    float Ai = 1.0f / (Dii * invTwodelta + Mii * invDelta);
    float Bi = 2.0f * Mii * invDelta * Ai;
    float Ci = (Dii * invTwodelta) * Ai - 0.5f * Bi;

    // Directly store the result to global memory
    ABCm[me_idx] = make_float4(Ai, Bi, Ci, Mii);
}