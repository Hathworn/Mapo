#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void sumArraysOnGPU(float *A, float *B, float *C, const int N){
    // Use shared memory to reduce global memory accesses
    extern __shared__ float sharedMem[];
    float *sharedA = sharedMem;
    float *sharedB = sharedMem + blockDim.x;

    int i = blockDim.x * blockIdx.x + threadIdx.x;

    if (i < N) {
        // Load data from global memory to shared memory
        sharedA[threadIdx.x] = A[i];
        sharedB[threadIdx.x] = B[i];
        __syncthreads();

        // Perform the computation
        C[i] = sharedA[threadIdx.x] + sharedB[threadIdx.x];
    }
}