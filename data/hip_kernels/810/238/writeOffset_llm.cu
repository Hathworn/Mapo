#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void writeOffset(float *A, float *B, float *C, const int n, int offset)
{
    unsigned int i = blockIdx.x * blockDim.x + threadIdx.x;
    unsigned int k = i + offset;

    // Optimize by minimizing calculation
    A += i;
    B += i;
    C += k;

    if (k < n) {
        // Use temporary variable to reduce global memory access latency
        float a = *A;
        float b = *B;
        *C = a + b;
    }
}