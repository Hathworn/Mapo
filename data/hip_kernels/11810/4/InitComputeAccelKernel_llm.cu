#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void InitComputeAccelKernel(double *CellAbscissa, double *CellOrdinate, double *Rmed, int nsec, int nrad) 
{
    int j = threadIdx.x + blockDim.x * blockIdx.x;
    int i = threadIdx.y + blockDim.y * blockIdx.y;

    if (i < nrad && j < nsec) {
        // Precompute common terms for efficiency
        double angle = (2.0 * PI * (double)j) / (double)nsec;
        double Rmed_i = Rmed[i];

        // Store results directly with fewer operations
        CellAbscissa[i * nsec + j] = Rmed_i * cos(angle);
        CellOrdinate[i * nsec + j] = Rmed_i * sin(angle);
    }
}