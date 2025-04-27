#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void VanLeerRadialKernel(double *Rinf, double *Rsup, double *QRStar, double *DensStar, double *Vrad, double *LostByDisk, int nsec, int nrad, double dt, int OpenInner, double *Qbase, double *invSurf)
{
    int j = threadIdx.x + blockDim.x * blockIdx.x;
    int i = blockIdx.y;  // Use block y-dimension for better memory coalescing

    if (i < nrad && j < nsec) {
        double dtheta = 2.0 * PI / (double)nsec;
        int index = i * nsec + j;
        int indexNext = (i + 1) * nsec + j;
        
        // Cache frequently used calculations
        double rinf_qrstar_dens_vrad = Rinf[i] * QRStar[index] * DensStar[index] * Vrad[index];
        double rsup_qrstar_dens_vrad = Rsup[i] * QRStar[indexNext] * DensStar[indexNext] * Vrad[indexNext];
        
        // Calculate varq using cached values
        double varq = dt * dtheta * (rinf_qrstar_dens_vrad - rsup_qrstar_dens_vrad);

        // Update Qbase with calculated varq
        Qbase[index] += varq * invSurf[i];

        // Handle OpenInner condition for LostByDisk
        if (i == 0 && OpenInner) {
            LostByDisk[j] = varq;
        }
    }
}