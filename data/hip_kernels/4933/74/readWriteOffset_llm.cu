#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void readWriteOffset(float *A, float *B, float *C, const int n, int offset)
{
    // Calculate global thread ID with offset
    unsigned int k = blockIdx.x * blockDim.x + threadIdx.x + offset;

    // Check within bounds and compute the result
    if (k < n) {
        C[k] = A[k] + B[k];
    }
}