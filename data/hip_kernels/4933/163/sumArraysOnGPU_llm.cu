#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void sumArraysOnGPU(float *A, float *B, float *C, const int N)
{
    int i = blockDim.x * blockIdx.x + threadIdx.x;
    int stride = blockDim.x * gridDim.x; // Compute stride for cooperative threads

    for (; i < N; i += stride) // Use loop to handle larger arrays
    {
        C[i] = A[i] + B[i];
    }
}