#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void sumArrays(float *A, float *B, float *C, const int N)
{
    // Obtain global thread index
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Loop to process multiple elements per thread for larger workloads
    for (int idx = i; idx < N; idx += gridDim.x * blockDim.x)
    {
        C[idx] = A[idx] + B[idx];
    }
}