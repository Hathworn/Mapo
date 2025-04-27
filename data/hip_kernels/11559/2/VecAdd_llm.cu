#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void VecAdd(float* A, float *B, float *C, int n)
{
    // Calculate global thread index
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Check bounds to avoid accessing out-of-range elements
    if (idx < n) {
        C[idx] = A[idx] + B[idx];
    }
}