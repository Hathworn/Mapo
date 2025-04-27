#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void sumArrays(float *A, float *B, float *C, const int N)
{
    int idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Process only if idx is within the range
    if (idx < N)
    {
        // Remove unnecessary loop
        C[idx] = A[idx] + B[idx];
    }
}