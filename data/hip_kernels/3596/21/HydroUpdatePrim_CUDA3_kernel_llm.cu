#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void HydroUpdatePrim_CUDA3_kernel(float *Rho, float *Vx, float *Vy, float *Vz, float *Etot, float *dUD, float *dUS1, float *dUS2, float *dUS3, float *dUTau, float dt, int size)
{
    // Simplified thread index calculation using intrinsic functions
    int igrid = blockIdx.x * blockDim.x + threadIdx.x + blockIdx.y * blockDim.x * gridDim.x;

    // Early return for threads not in valid range
    if (igrid < 2 || igrid >= size - 2) {
        return;
    }

    // Reorganize data access for better memory coalescing
    float D   = Rho[igrid] + dUD[igrid];
    float S1  = D * Vx[igrid] + dUS1[igrid];
    float S2  = D * Vy[igrid] + dUS2[igrid];
    float S3  = D * Vz[igrid] + dUS3[igrid];
    float Tau = D * Etot[igrid] + dUTau[igrid];

    // Apply updates
    Rho[igrid]  = D;
    Vx[igrid]   = S1 / D;
    Vy[igrid]   = S2 / D;
    Vz[igrid]   = S3 / D;
    Etot[igrid] = Tau / D;
}