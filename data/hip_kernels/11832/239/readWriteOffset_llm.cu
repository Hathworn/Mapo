#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void readWriteOffset(float *A, float *B, float *C, const int n, int offset)
{
    // Cache offset calculation outside the loop
    unsigned int i = blockIdx.x * blockDim.x + threadIdx.x;
    unsigned int k = i + offset;

    // Avoid unnecessary computation by checking offset first
    if (k < n) {
        // Use shared memory to cache data if possible (assuming independent work)
        __shared__ float sharedA[BLOCK_SIZE];
        __shared__ float sharedB[BLOCK_SIZE];
        
        if (threadIdx.x + offset < n) {
            sharedA[threadIdx.x] = A[k];
            sharedB[threadIdx.x] = B[k];
            __syncthreads();
            C[k] = sharedA[threadIdx.x] + sharedB[threadIdx.x];
        }
    }
}