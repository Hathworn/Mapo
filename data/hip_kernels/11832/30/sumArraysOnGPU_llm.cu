#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void sumArraysOnGPU(float *A, float *B, float *C, const int N)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x; // Utilize blockIdx for larger arrays

    if (i < N) C[i] = A[i] + B[i]; // Process elements within the valid range
}