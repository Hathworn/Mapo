#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void readWriteOffset(float *A, float *B, float *C, const int n, int offset)
{
    // Calculate global index with included offset
    unsigned int k = blockIdx.x * blockDim.x + threadIdx.x + offset;

    // Ensure the index is within the bounds
    if (k < n) {
        // Perform addition operation
        C[k] = A[k] + B[k];
    }
}