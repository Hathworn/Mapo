#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void OpenBoundaryKernel(double *Vrad, double *Dens, double *Energy, int nsec, double SigmaMed)
{
    int j = threadIdx.x + blockDim.x * blockIdx.x;
    int i = 1;

    if (j < nsec) {
        int idx = i * nsec + j;
        Dens[(i - 1) * nsec + j] = Dens[idx]; // copy first ring into ghost ring
        Energy[(i - 1) * nsec + j] = Energy[idx];
        // Simplified and optimized access to Vrad
        Vrad[idx] = (Vrad[(i + 1) * nsec + j] > 0.0 || Dens[idx] < SigmaMed) ? 0.0 : Vrad[(i + 1) * nsec + j];
    }
}