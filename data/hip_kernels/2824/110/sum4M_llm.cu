#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void sum4M(float *A, float *B, float *C, const int N) 
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Check boundary condition up front to avoid unnecessary computations
    if (i >= N) return;

    // Cache A[i] and B[i] to reduce memory access
    float ai = A[i];
    float bi = B[i];
    
    // Optimize unrolled loop and arithmetic operations
    #pragma unroll
    for (int j = 0; j < 4; j++) {
        float x = ai / 7.0 * ai;
        C[i] += ai / 3.0 + 20 * bi - ai * x + x * bi * 7;
        i += blockDim.x * gridDim.x;
        
        // Repeat boundary check within loop
        if (i >= N) return;
    }
}