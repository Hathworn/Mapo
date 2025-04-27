#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void matmulKernel(float *A, float *B, float *C, int rA, int cA, int cB) {
    // Optimize by reusing loaded C value and using registers
    int i = blockIdx.y * blockDim.y + threadIdx.y;
    int j = blockIdx.x * blockDim.x + threadIdx.x;
    if (i < rA && j < cB) {
        float sum = 0.0f; // Use register for accumulation
        for (int k = 0; k < cA; ++k) {
            sum += A[i * cA + k] * B[k * cB + j];
        }
        C[i * cB + j] = sum; // Store the result back to C
    }
}