#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void ReduceCsKernel(double *SoundSpeed, double *cs0, double *cs1, double *csnrm1, double *csnrm2, int nsec, int nrad)
{
    int j = threadIdx.x + blockDim.x * blockIdx.x;

    // Check once for boundaries to avoid duplication
    if (j < nsec) {
        // Load i=0 and i=nrad-1 values
        cs0[j] = SoundSpeed[j];
        cs1[j] = SoundSpeed[nsec + j];
        csnrm1[j] = SoundSpeed[(nrad - 1) * nsec + j];
        csnrm2[j] = SoundSpeed[(nrad - 2) * nsec + j];
    }
}