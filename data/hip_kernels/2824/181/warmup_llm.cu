#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void warmup(float *A, float *B, float *C, const int n, int offset)
{
    // Calculate global thread index
    unsigned int i = blockIdx.x * blockDim.x + threadIdx.x;
    unsigned int k = i + offset;

    // Check if k is in range, and perform computation efficiently
    if (k < n) {
        float a_val = A[i];  // Load A[i] to a register
        float b_val = B[i];  // Load B[i] to a register
        C[k] = a_val + b_val;  // Perform addition
    }
}