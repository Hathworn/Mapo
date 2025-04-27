#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void VecAdd(float * A, float * B, float * C, int N)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    // Check to ensure within bounds
    if (i < N) {
        C[i] = A[i] + B[i];
    }
}