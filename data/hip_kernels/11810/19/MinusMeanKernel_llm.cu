#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized global kernel function
__global__ void MinusMeanKernel(double *Dens, double *Energy, double SigmaMed, double mean_dens_r, double mean_dens_r2, double mean_energy_r, double mean_energy_r2, double EnergyMed, int nsec, int nrad, double SigmaMed2, double EnergyMed2)
{
    int j = threadIdx.x + blockDim.x * blockIdx.x;
    
    // Precompute common expressions
    double dens_adjustment = SigmaMed - mean_dens_r;
    double energy_adjustment = EnergyMed - mean_energy_r;
    double dens_adjustment2 = SigmaMed2 - mean_dens_r2;
    double energy_adjustment2 = EnergyMed2 - mean_energy_r2;

    if (j < nsec) {
        // Use computed values instead of recalculating
        Dens[j] += dens_adjustment;
        Energy[j] += energy_adjustment;
    }

    int i = nrad - 1;
    if (j < nsec) {
        // Use computed values instead of recalculating
        Dens[i * nsec + j] += dens_adjustment2;
        Energy[i * nsec + j] += energy_adjustment2;
    }
}