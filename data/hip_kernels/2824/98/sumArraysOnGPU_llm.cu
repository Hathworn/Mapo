#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void sumArraysOnGPU(float *A, float *B, float *C, const int N)
{
    // Calculate global index
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Use loop to handle multiple elements per thread
    for (int idx = i; idx < N; idx += blockDim.x * gridDim.x) {
        C[idx] = A[idx] + B[idx];
    }
}