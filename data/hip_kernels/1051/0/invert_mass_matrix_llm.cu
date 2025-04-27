#include "hip/hip_runtime.h"
#include "includes.h"

// Optimize global kernel function
__global__ void invert_mass_matrix(double *values, unsigned int size)
{
    unsigned int i = threadIdx.x + blockIdx.x * blockDim.x;

    // Check if index is within bounds
    if (i >= size) return;

    // Precompute reciprocal and store, avoiding branching
    double val = values[i];
    values[i] = (val > 1e-15) ? (1.0 / val) : 0.0;
}