#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void vectorAdd(const float *A, const float *B, float *C, int numElements)
{
    // Calculate index; use a single variable instead of re-computing
    int i = blockDim.x * blockIdx.x + threadIdx.x;

    // Ensure that threads process indices within bounds
    if (i < numElements)
    {
        // Execute addition using memory coalescing for better performance
        C[i] = __ldg(&A[i]) + __ldg(&B[i]);
    }
}