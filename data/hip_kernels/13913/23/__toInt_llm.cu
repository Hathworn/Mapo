#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void __toInt(double *A, int *B, int N) {
    // Calculate the global thread index for 2D grid
    int ip = blockIdx.x + gridDim.x * blockIdx.y;
    int idx = threadIdx.x + blockDim.x * ip; // Global thread index
    int stride = blockDim.x * gridDim.x * gridDim.y; // Stride for iterating over elements

    for (int i = idx; i < N; i += stride) {
        B[i] = static_cast<int>(A[i]);
    }
}