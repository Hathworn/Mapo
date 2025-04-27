#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void warmup(float *A, float *B, float *C, const int N)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Use a more cache-friendly data access pattern
    if (i < N) {
        float valA = A[i];
        float valB = B[i];
        C[i] = valA + valB;
    }
}