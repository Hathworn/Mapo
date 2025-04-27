#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized kernel function
__global__ void warmup(float *A, float *B, float *C, const int n, int offset)
{
    unsigned int k = blockIdx.x * blockDim.x + threadIdx.x + offset; // Combine offset addition

    if (k < n) {
        C[k] = A[k - offset] + B[k - offset]; // Use k for indexing with adjusted offset
    }
}