#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void sumArrays(float *A, float *B, float *C, const int N)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Unroll the loop to improve memory access
    #pragma unroll
    for (; i < N; i += blockDim.x * gridDim.x) {
        C[i] = A[i] + B[i];
    }
}