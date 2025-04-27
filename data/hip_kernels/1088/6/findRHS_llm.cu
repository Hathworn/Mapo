#include "hip/hip_runtime.h"
#include "includes.h"

__global__ static void findRHS(double* cOld, double* cCurr, double* cHalf, double* cNonLinRHS, int nx)
{
    // Calculate global index directly in 1D
    int index = blockIdx.x * blockDim.x + threadIdx.x + (blockIdx.y * blockDim.y + threadIdx.y) * nx;

    // Optimize memory access by reducing the global memory fetch count
    double currVal = cCurr[index];
    double oldVal = cOld[index];

    // Update cHalf with optimized arithmetic operations
    cHalf[index] += - (2.0 / 3.0) * (currVal - oldVal) + cNonLinRHS[index];

    // Set cOld to current value
    cOld[index] = currVal;
}