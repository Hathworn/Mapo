#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void CircumPlanetaryMassKernel (double *Dens, double *Surf, double *CellAbscissa, double *CellOrdinate, double xpl, double ypl, int nrad, int nsec, double HillRadius, double *mdcp0)
{
    int j = threadIdx.x + blockDim.x * blockIdx.x;
    int i = threadIdx.y + blockDim.y * blockIdx.y;

    if (i < nrad && j < nsec) {
        double x = CellAbscissa[i * nsec + j] - xpl;
        double y = CellOrdinate[i * nsec + j] - ypl;
        double dist = sqrt(x * x + y * y); // Optimize distance computation

        if (dist < HillRadius) {
            mdcp0[i * nsec + j] = Surf[i] * Dens[i * nsec + j];
        } else {
            mdcp0[i * nsec + j] = 0.0;
        }
    }
}