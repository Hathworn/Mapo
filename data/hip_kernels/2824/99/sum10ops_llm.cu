#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void sum10ops(float *A, float *B, float *C, const int N)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    if (i < N) {
        float a = A[i];  // Load A[i] once
        float b = B[i];  // Load B[i] once
        // Combine arithmetic operations to reduce instruction count
        C[i] = a + (b * 10 - 4 * a) * b - a * a - 8;
    }
}