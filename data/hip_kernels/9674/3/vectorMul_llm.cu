#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void vectorMul(const float *A, const float *B, float *C, int numElements)
{
    // Use more descriptive variable names
    int globalIdx = blockDim.x * blockIdx.x + threadIdx.x;

    // Reduce the number of operations by storing values in the register
    if (globalIdx < numElements)
    {
        float a = A[globalIdx];
        float b = B[globalIdx];
        C[globalIdx] = a * b;
    }
}