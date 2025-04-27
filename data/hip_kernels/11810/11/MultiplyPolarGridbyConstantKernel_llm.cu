#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void MultiplyPolarGridbyConstantKernel(double *Dens, int nrad, int nsec, double ScalingFactor)
{
    // Calculate global thread index for 2D grid and 2D block configuration
    int j = blockIdx.x * blockDim.x + threadIdx.x;
    int i = blockIdx.y * blockDim.y + threadIdx.y;

    // Ensure i is strictly less than nrad for safe memory access
    if (i < nrad && j < nsec) // Check grid bounds
        Dens[i * nsec + j] *= ScalingFactor;
}