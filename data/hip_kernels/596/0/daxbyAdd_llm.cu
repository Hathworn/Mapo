#include "hip/hip_runtime.h"
#include "includes.h"

// Optimize daxbyAdd kernel function
__global__ void daxbyAdd(const float *A, const float *B, float *C, float x, int numElements) {
    int i = blockDim.x * blockIdx.x + threadIdx.x;
    if (i < numElements) {
        // Use registers instead of global memory for intermediate calculations
        float a_val = A[i];
        float b_val = B[i];
        C[i] = a_val * x + b_val;
    }
}