#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void vecAddKernel(float *A, float *B, float *C, int n) {
    // Calculate global index
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Check index and perform addition
    if (i < n) {
        C[i] = A[i] + B[i];
    }
}