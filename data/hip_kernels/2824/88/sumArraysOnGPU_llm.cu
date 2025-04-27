#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void sumArraysOnGPU(float *A, float *B, float *C, const int N)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    __shared__ float d[256];

    if (i < N) {
        // Each thread computes its result directly without using shared memory.
        C[i] = A[i] + B[i];
    }
}