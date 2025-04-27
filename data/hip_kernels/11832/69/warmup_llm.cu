#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void warmup(float *A, float *B, float *C, const int n, int offset)
{
    // Calculate the global index
    unsigned int i = blockIdx.x * blockDim.x + threadIdx.x;
    unsigned int k = i + offset;

    // Ensure we do not access out-of-bounds memory
    if (k < n) {
        C[i] = A[k] + B[k];
    }
}