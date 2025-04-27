#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void precalculateABC(float4* ABCm, float* M, float timestep, float alpha, unsigned int numPoints)
{
    // Calculate unique thread index
    int me_idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Exit if index exceeds number of points
    if (me_idx >= numPoints)
        return;

    // Precompute constants for optimization
    float twodelta = timestep * 2.0f;
    float deltasqr = timestep * timestep;

    // Load mass
    float Mii = M[me_idx];
    float Dii = alpha * Mii;  // Apply mass-proportional damping

    // Compute coefficients using precomputed constants
    float Ai = 1.0f / (Dii / twodelta + Mii / deltasqr);
    float Bi = (2.0f * Mii / deltasqr) * Ai;
    float Ci = (Dii / twodelta) * Ai - 0.5f * Bi;

    // Store results in the output array
    ABCm[me_idx] = make_float4(Ai, Bi, Ci, Mii);
}