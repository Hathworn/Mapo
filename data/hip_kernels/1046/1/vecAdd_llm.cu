#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void vecAdd(int *A, int *B, int *C) {
    // Calculate the global index
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    // Simple operation, no need for optimizations like shared memory
    C[i] = __mul24(A[i], 10) + B[i]; // Use __mul24 intrinsic for efficient 24-bit integer multiplication
}