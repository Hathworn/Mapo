#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void readOffset(float *A, float *B, float *C, const int n, int offset)
{
    unsigned int i = blockIdx.x * blockDim.x + threadIdx.x;
    unsigned int k = i + offset;

    // Use shared memory to improve memory access efficiency
    extern __shared__ float sharedA[];
    extern __shared__ float sharedB[];

    if (k < n) {
        sharedA[threadIdx.x] = A[k];
        sharedB[threadIdx.x] = B[k];
        __syncthreads(); // Ensure all threads have loaded data into shared memory
        C[i] = sharedA[threadIdx.x] + sharedB[threadIdx.x];
    }
}