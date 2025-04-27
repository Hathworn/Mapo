#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void sumArrays(float *A, float *B, float *C, const int N)
{
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Check idx within bounds and perform addition only once
    if (idx < N)
    {
        C[idx] = A[idx] + B[idx];
    }
}