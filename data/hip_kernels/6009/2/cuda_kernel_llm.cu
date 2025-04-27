#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void cuda_kernel(double *A, double *B, double *C, int arraySize) {
    // Calculate a unique thread ID
    int tid = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure thread is within array bounds
    if (tid < arraySize) {
        // Perform addition directly
        C[tid] = A[tid] + B[tid];
    }
}