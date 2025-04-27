#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void writeOffset(float *A, float *B, float *C, const int n, int offset)
{
    // Calculate global index
    unsigned int i = blockIdx.x * blockDim.x + threadIdx.x;
    unsigned int k = i + offset;

    // Ensure index within bounds and perform computation
    if (k < n)
    {
        C[k] = A[i] + B[i];
    }
}