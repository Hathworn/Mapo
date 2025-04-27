#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void ElementWiseMultiply_CUDA(double *C, double *A, double *B, int rows, int cols)
{
    // Calculate the index using flat index instead of 2D, to simplify boundary check
    int idx = blockDim.x * blockIdx.x + threadIdx.x + (blockDim.y * blockIdx.y + threadIdx.y) * cols;

    // Check boundary with a single condition
    if (idx < rows * cols)
    {
        double a = A[idx];
        double b = B[idx];
        C[idx] = a * b;
    }
}