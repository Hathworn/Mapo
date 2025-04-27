#include "hip/hip_runtime.h"
#include "includes.h"

// Kernel function
__global__ void warmup(float *A, float *B, float *C, const int n, int offset)
{
    unsigned int i = blockIdx.x * blockDim.x + threadIdx.x;
    unsigned int k = i + offset;

    // Only perform operations if k is less than n
    if (k < n) {
        C[k] = A[i] + B[i]; // Perform vector addition
    }
}