#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void ComputeInternalEnergy_kernel(float *Rho, float *Vx, float *Vy, float *Vz, float *Etot, float *Eneint, float *Bx, float *By, float *Bz, int size)
{
    // calculate global thread index
    const long igrid = threadIdx.x + blockIdx.x * blockDim.x + blockIdx.y * blockDim.x * gridDim.x;

    if (igrid < size) {
        // optimize internal energy computation by minimizing redundant calculations
        const float velocity_squared = Vx[igrid] * Vx[igrid] + Vy[igrid] * Vy[igrid] + Vz[igrid] * Vz[igrid];
        const float magnetic_squared = (Bx[igrid] * Bx[igrid] + By[igrid] * By[igrid] + Bz[igrid] * Bz[igrid]) / Rho[igrid];

        Eneint[igrid] = Etot[igrid] - 0.5f * (velocity_squared + magnetic_squared);
    }
}