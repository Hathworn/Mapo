#include "hip/hip_runtime.h"
#include "includes.h"

// Improved global kernel function with better access pattern
__global__ void vadd(const float *A, const float *B, float *C, int ds) {
    int idx = threadIdx.x + blockDim.x * blockIdx.x;
    int stride = gridDim.x * blockDim.x;
    
    for (; idx < ds; idx += stride) {
        C[idx] = A[idx] + B[idx];
    }
}