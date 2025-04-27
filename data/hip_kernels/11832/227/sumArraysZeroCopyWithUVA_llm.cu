#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void sumArraysZeroCopyWithUVA(float *A, float *B, float *C, const int N)
{
    // Calculate unique thread index efficiently
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure thread id is within bounds before accessing arrays
    if (i < N) {
        C[i] = A[i] + B[i];
    }
}