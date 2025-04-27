#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void ReduceMeanKernel(double *Dens, double *Energy, int nsec, double *mean_dens, double *mean_energy, double *mean_dens2, double *mean_energy2, int nrad)
{
    int j = threadIdx.x + blockDim.x * blockIdx.x;

    // Unroll loop by handling both sections in parallel if valid
    if (j < nsec) {
        // Precompute indexes
        int index0 = j;
        int index1 = (nrad - 1) * nsec + j;

        // Coalesce memory access by applying both mean calculations simultaneously
        mean_dens[j] = Dens[index0];
        mean_energy[j] = Energy[index0];
        mean_dens2[j] = Dens[index1];
        mean_energy2[j] = Energy[index1];
    }
}