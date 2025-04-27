#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void readOffset(float *A, float *B, float *C, const int n, int offset)
{
    // Calculate global index with offset
    unsigned int k = blockIdx.x * blockDim.x + threadIdx.x + offset;

    // Use a shared memory buffer for better caching (optional, if applicable)
    __shared__ float sA;
    __shared__ float sB;

    // Check bounds before accessing global memory
    if (k < n) {
        sA = A[k];
        sB = B[k];
        __syncthreads();  // Ensure shared memory loading is complete

        C[k - offset] = sA + sB;  // Write result at the correct index
    }
}