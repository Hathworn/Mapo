#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void vecMult(float* a, float* b, float* c, const int N) {
    __shared__ float localA[BLOCK_SIZE]; // Use shared memory for a
    __shared__ float localB[BLOCK_SIZE]; // Use shared memory for b
    const int i = blockIdx.x * blockDim.x + threadIdx.x;

    if (i < N) {
        // Load data into shared memory
        localA[threadIdx.x] = a[i];
        localB[threadIdx.x] = b[i];
        __syncthreads(); // Ensure all threads have loaded their data

        // Perform the computation
        c[i] = localA[threadIdx.x] * localB[threadIdx.x];
    }
}