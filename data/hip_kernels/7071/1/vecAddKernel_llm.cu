#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void vecAddKernel(float* A, float* B, float* C, int n) {
    // Calculate global thread index -------------------
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Process only threads with indices less than n ----
    if (i < n) {
        C[i] = A[i] + B[i];
    }
}