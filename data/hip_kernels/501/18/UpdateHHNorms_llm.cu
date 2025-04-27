#include "hip/hip_runtime.h"
#include "includes.h"
#define NTHREADS 512

// Updates the column norms by subtracting the Hadamard-square of the
// Householder vector.
//
// N.B.: Overflow incurred in computing the square should already have
// been detected in the original norm construction.

__global__ void UpdateHHNorms(int cols, float *dV, float *dNorms) {
// Copyright 2009, Mark Seligman at Rapid Biologics, LLC.  All rights
// reserved.

    int colIndex = threadIdx.x + blockIdx.x * blockDim.x;

    // Ensure thread is within bounds before accessing arrays
    if (colIndex < cols) {
        float val = dV[colIndex];
        
        // Use atomic operation to prevent race conditions if needed
        atomicAdd(&dNorms[colIndex], -val * val);
    }
}