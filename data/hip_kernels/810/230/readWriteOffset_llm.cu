#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void readWriteOffset(float *A, float *B, float *C, const int n, int offset)
{
    // Calculate index using offset
    unsigned int k = blockIdx.x * blockDim.x + threadIdx.x + offset;

    // Ensure computation only occurs if within bounds
    if (k < n) {
        // Perform the computation directly if within bounds
        C[k] = A[k] + B[k];
    }
}