#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void rowDiv(float* a, float* b, float* c, int M, int N) {
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    if (i < M * N) { // Ensure we do not access out of bounds
        c[i] = a[i] / b[blockIdx.x]; // Division operation
    }
}