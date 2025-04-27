```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void sumArraysOnGPU(float *A, float *B, float *C, const int N)
{
    // Optimize by calculating global thread index
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Use grid-stride loop for coalesced memory access and handling larger arrays
    while (i < N) {
        C[i] = A[i] + B[i];
        i += blockDim.x * gridDim.x;
    }
}