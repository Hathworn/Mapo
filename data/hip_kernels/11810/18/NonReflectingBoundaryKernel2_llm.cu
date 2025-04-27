#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void NonReflectingBoundaryKernel2(double *Dens, double *Energy, int i_angle, int nsec, double *Vrad, double *SoundSpeed, double SigmaMed, int nrad, double SigmaMed2, int i_angle2)
{
    int j = threadIdx.x + blockDim.x * blockIdx.x;
    if (j < nsec) { // Ensure j is within bounds
        double Vrad_med;

        // Calculate for i = 1
        int idx_1 = 1 * nsec + j;
        Vrad_med = -SoundSpeed[idx_1] * (Dens[idx_1] - SigmaMed) / SigmaMed;
        Vrad[idx_1] = 2.0 * Vrad_med - Vrad[(1 + 1) * nsec + j];

        // Calculate for i = nrad - 1
        int idx_nrad_1 = (nrad - 1) * nsec + j;
        int idx_nrad_2 = (nrad - 2) * nsec + j;
        Vrad_med = SoundSpeed[idx_nrad_1] * (Dens[idx_nrad_2] - SigmaMed2) / SigmaMed2;
        Vrad[idx_nrad_1] = 2.0 * Vrad_med - Vrad[idx_nrad_2];
    }
}
```
