#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void readOffsetUnroll2(float *A, float *B, float *C, const int n, int offset)
{
    unsigned int i = blockIdx.x * blockDim.x * 2 + threadIdx.x;
    unsigned int k = i + offset;

    // Check bounds and calculate in one statement where possible
    if (k < n) {
        C[i] = A[k] + B[k];
    }
    k += blockDim.x; // Compute k + blockDim.x in advance to optimize the memory access pattern
    if (k < n) {
        C[i + blockDim.x] = A[k] + B[k];
    }
}