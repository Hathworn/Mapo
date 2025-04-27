#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void vecAddKernel(float *A, float *B, float *C, int n) {
    // Precompute thread index to improve readability
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    // Use branch-less instruction to reduce control divergence
    if (i < n) {
        C[i] = A[i] + B[i];
    }
}