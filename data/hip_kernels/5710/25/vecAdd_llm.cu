#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized global kernel function with boundary check
__global__ void vecAdd(float *A, float *B, float *C, int n) {
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    if (i < n) {
        C[i] = A[i] + B[i];  // Ensure thread does not exceed array bounds
    }
}