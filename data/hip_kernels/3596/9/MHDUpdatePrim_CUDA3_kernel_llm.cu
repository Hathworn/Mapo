#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void MHDUpdatePrim_CUDA3_kernel(float *Rho, float *Vx, float *Vy, float *Vz, float *Etot, float *Bx, float *By, float *Bz, float *Phi, float *dUD, float *dUS1, float *dUS2, float *dUS3, float *dUTau, float *dUBx, float *dUBy, float *dUBz, float *dUPhi, float dt, float C_h, float C_p, int size)
{
    // Calculate unique grid index
    const long igrid = threadIdx.x + blockIdx.x * blockDim.x + blockIdx.y * blockDim.x * gridDim.x;

    // Boundary check
    if (igrid < 2 || igrid > size - 3)
        return;

    // Load shared memory to reduce global memory accesses
    float D = Rho[igrid] + dUD[igrid];
    float S1 = D * Vx[igrid] + dUS1[igrid];
    float S2 = D * Vy[igrid] + dUS2[igrid];
    float S3 = D * Vz[igrid] + dUS3[igrid];
    float Tau = D * Etot[igrid] + dUTau[igrid];

    // Update primary variables
    Rho[igrid] = D;
    Vx[igrid] = S1 / D;
    Vy[igrid] = S2 / D;
    Vz[igrid] = S3 / D;
    Etot[igrid] = Tau / D;

    // Use atomic operations if needed to ensure data consistency
    Bx[igrid] += dUBx[igrid];
    By[igrid] += dUBy[igrid];
    Bz[igrid] += dUBz[igrid];

    // Update and decay Phi
    float phiUpdate = Phi[igrid] + dUPhi[igrid];
    Phi[igrid] = phiUpdate * expf(-dt * (C_h / C_p) * (C_h / C_p));
}