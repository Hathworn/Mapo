#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void Substep2Kernel (double *Dens, double *VradInt, double *VthetaInt, double *TemperInt, int nrad, int nsec, double *invdiffRmed, double *invdiffRsup, double *DensInt, int Adiabatic, double *Rmed, double dt, double *VradNew, double *VthetaNew, double *Energy, double *EnergyInt)
{
    // Use a single thread ID calculation to improve readability and performance
    int index = threadIdx.x + blockDim.x * blockIdx.x + (threadIdx.y + blockDim.y * blockIdx.y) * nsec;

    if (index < nrad * nsec) {
        int i = index / nsec;
        int j = index % nsec;

        double dv;

        // Calculate radial velocity difference
        dv = VradInt[(i + 1) * nsec + j] - VradInt[i * nsec + j];

        // Update DensInt using ternary operator for clarity
        DensInt[i * nsec + j] = (dv < 0.0) ? CVNR * CVNR * Dens[i * nsec + j] * dv * dv : 0.0;

        // Calculate azimuthal velocity difference
        dv = VthetaInt[i * nsec + (j + 1) % nsec] - VthetaInt[i * nsec + j];

        // Update TemperInt using ternary operator for clarity
        TemperInt[i * nsec + j] = (dv < 0.0) ? CVNR * CVNR * Dens[i * nsec + j] * dv * dv : 0.0;
    }
}