#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void warmup(float *A, float *B, float *C, const int n, int offset)
{
    unsigned int i = blockIdx.x * blockDim.x + threadIdx.x;
    unsigned int k = i + offset;

    if (k < n && i < n) // Added check to ensure i is within bounds
    {
        C[k] = A[i] + B[i]; // Perform computation only if both indices are valid
    }
}