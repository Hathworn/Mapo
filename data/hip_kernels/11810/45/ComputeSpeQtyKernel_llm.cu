#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void ComputeSpeQtyKernel(double *Label, double *Dens, double *ExtLabel, int nrad, int nsec)
{
    // Calculate global thread ID
    int j = threadIdx.x + blockDim.x * blockIdx.x;
    int i = threadIdx.y + blockDim.y * blockIdx.y;
    
    // Boundary check
    if (i < nrad && j < nsec) {
        // Main computation
        Label[i * nsec + j] = ExtLabel[i * nsec + j] / Dens[i * nsec + j];
        // Compressive flow possibility
        // Label[i * nsec + j] = ExtLabel[i * nsec + j];
    }
}