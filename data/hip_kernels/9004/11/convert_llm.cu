#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void convert(double* A, double* C)
{
    // Calculate the global index with grid-stride loop
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = gridDim.x * blockDim.x;

    for (int i = idx; i < SIZE; i += stride)
    {
        A[i] = C[SIZE - i - 1];
    }
}