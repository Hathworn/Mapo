#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void CorrectVthetaKernel (double *Vtheta, double domega, double *Rmed, int nrad, int nsec)
{
    // Calculate the global thread indices for x and y dimensions
    int j = blockIdx.x * blockDim.x + threadIdx.x;
    int i = blockIdx.y * blockDim.y + threadIdx.y;

    // Ensure thread operates within the bounds of the array
    if (i < nrad && j < nsec)
    {
        // Perform the main operation on the relevant element
        Vtheta[i * nsec + j] -= domega * Rmed[i]; // Simplified the operation
    }
}