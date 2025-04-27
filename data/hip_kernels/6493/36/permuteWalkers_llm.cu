#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void permuteWalkers ( const int dim, const int nwl, const int *kr, const float *xxC, float *xxCP ) {
    // Calculate global thread ID
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    int j = blockIdx.y * blockDim.y + threadIdx.y;
    
    // Ensure only valid indices are processed
    if ( i < dim && j < nwl ) {
        int t = i + j * dim; // Linear index calculation
        int p = i + kr[j] * dim; // Permuted index calculation
        xxCP[t] = xxC[p]; // Assign permuted value
    }
}