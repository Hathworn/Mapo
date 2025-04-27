#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel(double *Dens, double *VradInt, double *VthetaInt, double *TemperInt, int nrad, int nsec, double *invdiffRmed, double *invdiffRsup, double *DensInt, int Adiabatic, double *Rmed, double dt, double *VradNew, double *VthetaNew, double *Energy, double *EnergyInt)
{
    int j = threadIdx.x + blockDim.x * blockIdx.x;
    int i = threadIdx.y + blockDim.y * blockIdx.y;

    if (i < nrad && j < nsec) {
        double dxtheta = 2.0 * PI / nsec * Rmed[i];
        double invdxtheta = 1.0 / dxtheta;

        if (i > 0) {
            // Combined conditions and computation for VradNew
            double dens = Dens[i*nsec + j] + Dens[(i-1)*nsec + j];
            double densint = DensInt[i*nsec+j] - DensInt[(i-1)*nsec + j];
            VradNew[i*nsec+j] = VradInt[i*nsec+j] - dt * 2.0 / dens * densint * invdiffRmed[i];
        }

        // Optimized computation for VthetaNew
        double dens2 = Dens[i*nsec + j] + Dens[i*nsec + ((j-1)+nsec) % nsec];
        double tempint = TemperInt[i*nsec+j] - TemperInt[i*nsec + ((j-1)+nsec) % nsec];
        VthetaNew[i*nsec + j] = VthetaInt[i*nsec + j] - dt * 2.0 / dens2 * tempint * invdxtheta;

        // If Adiabatic, update EnergyInt
        if (Adiabatic) {
            EnergyInt[i * nsec + j] = Energy[i * nsec + j] - dt * DensInt[i * nsec + j] * 
            (VradInt[(i+1) * nsec + j] - VradInt[i * nsec + j]) * invdiffRsup[i] - 
            dt * TemperInt[i * nsec + j] * (VthetaInt[i * nsec + (j+1)%nsec] - VthetaInt[i * nsec + j]) * invdxtheta;
        }
    }
}