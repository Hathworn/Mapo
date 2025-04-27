#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void sumArrays(float *A, float *B, float *C, const int N)
{
    int idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Only compute if index is within bounds
    if (idx < N)
    {
        // Perform the addition once per index
        C[idx] = A[idx] + B[idx];
    }
}