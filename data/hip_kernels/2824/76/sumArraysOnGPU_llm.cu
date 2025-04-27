#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void sumArraysOnGPU(float *A, float *B, float *C, const int N)
{
    // Calculate the global thread index
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Unroll loop to utilize memory coalescing and increase throughput
    int stride = blockDim.x * gridDim.x;
    for (int idx = i; idx < N; idx += stride) {
        C[idx] = A[idx] + B[idx];
    }
}