#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void ComputeVelocitiesKernel (double *Vrad, double *Vtheta, double *Dens, double *Rmed, double *ThetaMomP, double *ThetaMomM, double *RadMomP, double *RadMomM, int nrad, int nsec, double OmegaFrame)
{
    int j = blockIdx.x * blockDim.x + threadIdx.x;
    int i = blockIdx.y * blockDim.y + threadIdx.y;

    if (i < nrad && j < nsec) {
        // Use condition to avoid division by small numbers or zero
        double dens_ij = Dens[i*nsec + j];
        double dens_ijm1 = Dens[i*nsec + ((j - 1 + nsec) % nsec)];
        
        if (i == 0) {
            Vrad[i*nsec + j] = 0.0;
        } else {
            double dens_im1j = Dens[(i - 1)*nsec + j];
            double denominator_rad = dens_ij + dens_im1j + 1e-20;
            Vrad[i*nsec + j] = (RadMomP[(i - 1)*nsec + j] + RadMomM[i*nsec + j]) / denominator_rad;
        }
        
        double denominator_theta = dens_ij + dens_ijm1 + 1e-15;
        Vtheta[i*nsec + j] = (ThetaMomP[i*nsec + ((j - 1 + nsec) % nsec)] + ThetaMomM[i*nsec + j]) / denominator_theta / Rmed[i] - Rmed[i] * OmegaFrame;
    }
}