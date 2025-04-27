#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void readOffsetUnroll4(float *A, float *B, float *C, const int n, int offset)
{
    // Calculate the global index for the thread using unroll factor
    unsigned int i = blockIdx.x * blockDim.x * 4 + threadIdx.x;
    unsigned int k = i + offset;

    // Use shared memory for coalesced access
    __shared__ float sharedA[4 * blockDim.x];
    __shared__ float sharedB[4 * blockDim.x];

    if (k + 3 * blockDim.x < n)
    {
        // Load data into shared memory
        sharedA[threadIdx.x]                 = A[k];
        sharedA[threadIdx.x + blockDim.x]    = A[k + blockDim.x];
        sharedA[threadIdx.x + 2 * blockDim.x] = A[k + 2 * blockDim.x];
        sharedA[threadIdx.x + 3 * blockDim.x] = A[k + 3 * blockDim.x];

        sharedB[threadIdx.x]                 = B[k];
        sharedB[threadIdx.x + blockDim.x]    = B[k + blockDim.x];
        sharedB[threadIdx.x + 2 * blockDim.x] = B[k + 2 * blockDim.x];
        sharedB[threadIdx.x + 3 * blockDim.x] = B[k + 3 * blockDim.x];
        
        __syncthreads(); // Synchronize here to ensure data is loaded

        // Perform computation using shared memory
        C[i]                  = sharedA[threadIdx.x]                  + sharedB[threadIdx.x];
        C[i + blockDim.x]     = sharedA[threadIdx.x + blockDim.x]     + sharedB[threadIdx.x + blockDim.x];
        C[i + 2 * blockDim.x] = sharedA[threadIdx.x + 2 * blockDim.x] + sharedB[threadIdx.x + 2 * blockDim.x];
        C[i + 3 * blockDim.x] = sharedA[threadIdx.x + 3 * blockDim.x] + sharedB[threadIdx.x + 3 * blockDim.x];
    }
}