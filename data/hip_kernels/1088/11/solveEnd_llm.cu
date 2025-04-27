#include "hip/hip_runtime.h"
#include "includes.h"
__global__ static void solveEnd ( double* data,  const double a, const double b, const double d, const double e,  const double omega_11, const double omega_12, const double omega_21, const double omega_22,  const int nx, const int nBatch )
{
    // Matrix index
    int globalIdx = blockDim.x * blockIdx.x + threadIdx.x;

    // Bounds checking to prevent out-of-bounds access
    if (globalIdx >= nBatch * nx) return;

    // Pre-calculating repeated index calculations
    int baseIdx = globalIdx + (nx - 4) * nBatch; 

    // Last two vectors
    double newNx2;
    double newNx1;

    // Compute lambda = d^~ - transpose(g) * inverse(E) * d_hat
    newNx2 = data[baseIdx + 2 * nBatch] - (e * data[globalIdx] + a * data[baseIdx] + b * data[baseIdx + nBatch]);
    newNx1 = data[baseIdx + 3 * nBatch] - (d * data[globalIdx] + e * data[nBatch + globalIdx] + a * data[baseIdx + nBatch]);

    // Compute x^~ = omega * lambda
    data[baseIdx + 2 * nBatch] = omega_11 * newNx2 + omega_12 * newNx1;
    data[baseIdx + 3 * nBatch] = omega_21 * newNx2 + omega_22 * newNx1;
}