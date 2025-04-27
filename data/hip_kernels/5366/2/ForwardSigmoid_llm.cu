#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void ForwardSigmoid(float* Z, int nRowsZ, int nColsZ, float* A)
{
    int index = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = blockDim.x * gridDim.x;

    // Unroll the loop to improve performance
    for (int i = index; i < nRowsZ * nColsZ; i += stride)
    {
        A[i] = 1 / (1 + exp(-Z[i]));
    }
}