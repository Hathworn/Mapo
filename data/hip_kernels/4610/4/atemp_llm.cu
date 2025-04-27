#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void atemp(double* A, double* y, double* tmp, int NX, int NY)
{
    int i = blockDim.x * blockIdx.x + threadIdx.x;

    // Early exit if `i` is out of bounds
    if (i >= NY) return;

    double y_sum = 0.0; // Optimize by using a local accumulator
    for (int j = 0; j < NX; j++) {
        y_sum += A[i + j * NY] * tmp[j];
    }
    y[i] += y_sum; // Update global memory once
}