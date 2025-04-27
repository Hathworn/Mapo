#include "hip/hip_runtime.h"
#include "includes.h"
#define NTHREADS 512

// Updates the column norms by subtracting the Hadamard-square of the
// Householder vector.
//
// N.B.:  Overflow incurred in computing the square should already have
// been detected in the original norm construction.

__global__ void UpdateHHNorms(int cols, float *dV, float *dNorms) {
    // Ensure each thread processes multiple elements for better efficiency
    int colIndex = threadIdx.x + blockIdx.x * blockDim.x;
    int stride = blockDim.x * gridDim.x;

    for (int i = colIndex; i < cols; i += stride) {
        float val = dV[i];
        dNorms[i] -= val * val;
    }
}