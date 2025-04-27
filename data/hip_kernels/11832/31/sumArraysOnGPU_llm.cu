#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void sumArraysOnGPU(float *A, float *B, float *C, const int N)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Use grid-stride loop to handle more elements with fewer kernel launches
    for (; i < N; i += blockDim.x * gridDim.x) {
        C[i] = A[i] + B[i];
    }
}