#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void vectorAdd(const float *A, const float *B, float *C, int numElements)
{
    int i = blockDim.x * blockIdx.x + threadIdx.x;

    // Use loop to handle multiple elements per thread, improving resource utilization
    for (; i < numElements; i += blockDim.x * gridDim.x)
    {
        C[i] = A[i] + B[i];
    }
}