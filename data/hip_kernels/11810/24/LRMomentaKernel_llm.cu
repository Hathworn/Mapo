#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void LRMomentaKernel (double *RadMomP, double *RadMomM, double *ThetaMomP, double *ThetaMomM, double *Dens, double *Vrad, double *Vtheta, int nrad, int nsec, double *Rmed, double OmegaFrame)
{
    int j = threadIdx.x + blockDim.x * blockIdx.x;
    int i = threadIdx.y + blockDim.y * blockIdx.y;

    if (i < nrad && j < nsec) {
        int idx = i * nsec + j;  // Precompute linear index

        RadMomP[idx] = Dens[idx] * Vrad[(i+1) * nsec + j]; // (i+1)*nsec
        RadMomM[idx] = Dens[idx] * Vrad[idx];

        double ROmega = Rmed[i] * OmegaFrame; // Precompute ROmega
        double DensRmed = Dens[idx] * Rmed[i]; // Precompute DensRmed

        ThetaMomP[idx] = DensRmed * (Vtheta[i * nsec + (j+1) % nsec] + ROmega);
        ThetaMomM[idx] = DensRmed * (Vtheta[idx] + ROmega);
    }
}