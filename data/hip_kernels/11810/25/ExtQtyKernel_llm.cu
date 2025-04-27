#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void ExtQtyKernel(double *ExtLabel, double *Dens, double *Label, int nsec, int nrad)
{
    // Calculate global thread index in flatten grid
    int j = blockIdx.x * blockDim.x + threadIdx.x; 
    int i = blockIdx.y * blockDim.y + threadIdx.y; 

    // Boundary check to avoid out-of-bounds memory access
    if (i < nrad && j < nsec) 
    {
        // Compute extended quantity
        int index = i * nsec + j; // Compute the flattened index
        ExtLabel[index] = Dens[index] * Label[index]; // Efficient memory access
    }
}