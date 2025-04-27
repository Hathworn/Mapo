#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void readWriteOffset(float *A, float *B, float *C, const int n, int offset)
{
    // Calculate once to improve efficiency
    unsigned int k = blockIdx.x * blockDim.x + threadIdx.x + offset;

    // Ensure calculations only occur if within bounds
    if (k < n)
    {
        C[k] = A[k] + B[k];
    }
}