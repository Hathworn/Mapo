#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void warmup(float *A, float *B, float *C, const int N)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Use branchless programming for bounds checking
    if (i < N)
    {
        C[i] = A[i] + B[i]; // Direct computation inside the condition
    }
}