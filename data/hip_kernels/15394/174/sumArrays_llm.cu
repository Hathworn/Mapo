#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void sumArrays(float *A, float *B, float *C, const int N)
{
    int idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Limit iteration to work on valid data
    if (idx < N)
    {
        // Perform the addition operation once per thread
        C[idx] = A[idx] + B[idx];
    }
}