#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void readOffset(float *A, float *B, float *C, const int n, int offset)
{
    // Calculate global index with offset applied
    unsigned int k = blockIdx.x * blockDim.x + threadIdx.x + offset;
    
    // Ensure the computed index is within bounds
    if (k < n) {
        C[k - offset] = A[k] + B[k]; // Use C[k - offset] to align with input arrays
    }
}