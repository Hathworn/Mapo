#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void sumArraysOnGPU(float *A, float *B, float *C, const int N) {
    int i = blockIdx.x * blockDim.x + threadIdx.x; // Calculate global thread index
    if (i < N) {
        // Use temporary variable to avoid redundant memory loads
        float a = A[i];
        float b = B[i];
        C[i] = a + b;
    }
}