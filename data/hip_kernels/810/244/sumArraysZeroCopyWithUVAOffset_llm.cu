#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void sumArraysZeroCopyWithUVAOffset(float *A, float *B, float *C, const int N, int offset)
{
    // Calculate the global index
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Use shared memory to cache offset value for faster access
    __shared__ int sharedOffset;
    if (threadIdx.x == 0) {
        sharedOffset = offset;
    }
    __syncthreads();

    // Perform calculation only for valid indices
    if (i < N) {
        int idx = i + sharedOffset;  // Use cached offset
        C[idx] = A[idx] + B[idx];
    }
}