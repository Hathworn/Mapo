#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void __floatToInt(float *A, int *B, int N) {
    int ip = blockIdx.x * blockDim.x + threadIdx.x + blockIdx.y * gridDim.x * blockDim.x;

    int gridStride = blockDim.x * gridDim.x * gridDim.y; // Calculate grid stride once

    for (int i = ip; i < N; i += gridStride) {
        B[i] = static_cast<int>(A[i]); // Use static_cast for clarity
    }
}