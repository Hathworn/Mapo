#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void sumArraysOnGPUlocal(float *A, float *B, float *C, const int N)
{
    // Use register local variable instead of array
    float local;
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    if (i < N) {
        // Calculate only the needed local value
        local = 2 * A[i];
        C[i] = A[i] + B[i] + local;
    }
}