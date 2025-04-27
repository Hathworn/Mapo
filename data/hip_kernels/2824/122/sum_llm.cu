#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void sum(float *A, float *B, float *C, const int N)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Use loop unrolling for efficiency
    if (i < N) {
        C[i] = A[i] + B[i];
        if (i + blockDim.x < N) C[i + blockDim.x] = A[i + blockDim.x] + B[i + blockDim.x];
    }
}