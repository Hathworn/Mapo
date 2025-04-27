#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void vecAdd(int *A, int *B, int *C) {
    // Calculate index
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure within bounds
    if (i < N) {
        // Perform addition
        C[i] = A[i] + B[i];
    }
}