#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void sumArraysZeroCopy(float *A, float *B, float *C, const int N)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Check against boundary and process multiple elements per thread to optimize workload
    for (int idx = i; idx < N; idx += blockDim.x * gridDim.x) {
        C[idx] = A[idx] + B[idx];
    }
}