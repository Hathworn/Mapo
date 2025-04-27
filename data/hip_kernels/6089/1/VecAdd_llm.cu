#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void VecAdd(float* A, float* B, float* C, int N)
{
    // Calculate global thread ID
    int tid = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure that the thread accesses valid memory
    if (tid < N) {
        C[tid] = A[tid] + B[tid];
    }
}