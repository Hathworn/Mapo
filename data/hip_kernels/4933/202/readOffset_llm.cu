#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void readOffset(float *A, float *B, float *C, const int n, int offset)
{
    // Calculate global thread index
    unsigned int i = blockIdx.x * blockDim.x + threadIdx.x;
    // Pre-calculate offset position
    unsigned int k = i + offset;

    // Use shared memory for improved performance (if available)
    extern __shared__ float sharedDataA[];
    extern __shared__ float sharedDataB[];

    // Load data into shared memory (optional optimization)
    if (k < n) {
        sharedDataA[threadIdx.x] = A[k];
        sharedDataB[threadIdx.x] = B[k];
        __syncthreads();

        // Ensure memory boundaries are respected
        C[i] = sharedDataA[threadIdx.x] + sharedDataB[threadIdx.x];
    }
}