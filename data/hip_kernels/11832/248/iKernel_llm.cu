#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void iKernel(float *A, float *B, float *C, const int N)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Use if condition outside memory access to reduce warp divergence
    if (i < N) {
        C[i] = A[i] + B[i];
    }
}