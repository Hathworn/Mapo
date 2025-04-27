#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void writeOffset(float *A, float *B, float *C, const int n, int offset)
{
    // Calculate global thread index
    unsigned int i = blockIdx.x * blockDim.x + threadIdx.x;
    unsigned int k = i + offset;

    // Check bounds and compute only if within limits
    if (k < n) {
        C[k] = A[i] + B[i];
    }
}