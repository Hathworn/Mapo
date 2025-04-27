#include "hip/hip_runtime.h"
#include "includes.h"

// Improved global kernel function for vector addition
__global__ void vec_add(int N, int *A, int *B, int *C) {
    int i = threadIdx.x + blockIdx.x * blockDim.x;
    // Use valid index to perform element-wise vector multiplication
    if (i < N) {
        C[i] = A[i] * B[i];
    }
}