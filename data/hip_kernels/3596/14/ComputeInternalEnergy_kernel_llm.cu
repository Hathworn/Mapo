#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void ComputeInternalEnergy_kernel(float *Vx, float *Vy, float *Vz, float *Etot, float *Eneint, int size)
{
    // Get global thread index directly using blockDim.x and blockIdx.x/y
    int igrid = threadIdx.x + blockIdx.x * blockDim.x + blockIdx.y * blockDim.x * gridDim.x;

    // Ensure thread does not process out-of-bounds memory
    if (igrid >= size) return;

    // Calculate kinetic energy and internal energy
    float velocitySquared = Vx[igrid] * Vx[igrid] + Vy[igrid] * Vy[igrid] + Vz[igrid] * Vz[igrid];
    Eneint[igrid] = Etot[igrid] - 0.5f * velocitySquared;
}