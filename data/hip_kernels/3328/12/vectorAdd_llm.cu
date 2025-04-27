#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void vectorAdd(const float *A, const float *B, float *C, int numElements)
{
    // Calculate global thread index
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Loop to cover more elements per thread, improving GPU utilization
    for (int idx = i; idx < numElements; idx += blockDim.x * gridDim.x)
    {
        C[idx] = A[idx] + B[idx];
    }
}