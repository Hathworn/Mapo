#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void DivisePolarGridKernel (double *Qbase, double *DensInt, double *Work, int nrad, int nsec)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x; // Compute global row index
    int j = blockIdx.y * blockDim.y + threadIdx.y; // Compute global column index

    // Ensure threads accessing valid elements
    if (i < nsec && j < nrad) 
    {
        Work[i * nrad + j] = Qbase[i * nrad + j] / (DensInt[i * nrad + j] + 1e-20);
    }
}