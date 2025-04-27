#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void vectorAdd(const float *A, const float *B, float *C, int n)
{
    int i = blockDim.x * blockIdx.x + threadIdx.x;
    
    // Efficient check to ensure thread is within bounds
    if (i >= n) return;

    C[i] = A[i] + B[i];
}