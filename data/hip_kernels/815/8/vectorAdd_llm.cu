#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void vectorAdd(const float* __restrict__ A, const float* __restrict__ B, float* __restrict__ C, int N)
{
    int i = blockDim.x * blockIdx.x + threadIdx.x;
    if (i < N) {
        // Load data into registers for faster access
        float a = A[i];
        float b = B[i];
        C[i] = a + b;
    }
}