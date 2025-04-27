#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void Convolution(double* A, double* B, int I, int J)
{
    int i = blockDim.x * blockIdx.x + threadIdx.x;

    // Constants declaration outside the loop
    const double c11 = +0.2, c21 = +0.5, c31 = -0.8;
    const double c12 = -0.3, c22 = +0.6, c32 = -0.9;
    const double c13 = +0.4, c23 = +0.7, c33 = +0.1;

    // Optimize boundary and condition checks
    if (i > J && i < I * J - J && (i % J != 0) && ((i + 1) % J != 0)) {
        // Optimize memory access pattern by reducing indirection
        double *Ai = &A[i];
        B[i] = c11 * Ai[-J-1] + c12 * Ai[-1] + c13 * Ai[J-1]
             + c21 * Ai[-J]   + c22 * Ai[0] + c23 * Ai[J]
             + c31 * Ai[-J+1] + c32 * Ai[1] + c33 * Ai[J+1];
    }
}