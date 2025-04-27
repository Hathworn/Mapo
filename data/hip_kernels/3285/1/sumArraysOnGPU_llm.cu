#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void sumArraysOnGPU(float *A, float *B, float *C, const int N) {
    // Calculate global thread ID using block & thread indices
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Ensure the thread ID is within bounds before accessing memory
    if (idx < N) {
        C[idx] = A[idx] + B[idx];
    }
}