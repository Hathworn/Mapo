#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void fill_A_expansion(float* A, int* rowind, int* colind, float* val, int npix, int nimages) {
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    int totalPixels = npix * nimages; // Precompute total pixels for boundary check
    
    if (i < totalPixels) { // Simplified boundary condition
        rowind[i] = i;
        colind[i] = i % npix;
        val[i] = A[i];
    }
}