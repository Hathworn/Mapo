#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void sumArraysOnGPU(float *A, float *B, float *C, int n) {
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    if (idx < n) { // Check bounds to avoid accessing out of array limits
        C[idx] = A[idx] + B[idx];
    }
}