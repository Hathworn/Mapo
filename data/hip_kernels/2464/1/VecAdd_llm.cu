#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void VecAdd(const float* A, const float* B, float* C, int N)
{
    // Calculate the global thread index
    int i = blockDim.x * blockIdx.x + threadIdx.x;
    
    // Use warp-level optimization by iterating over array with stride
    for (int idx = i; idx < N; idx += blockDim.x * gridDim.x) {
        C[idx] = A[idx] + B[idx];
    }
}