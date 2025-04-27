#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void sumArraysZeroCopy(int *A, int *B, int *C, const int N)
{
    // Calculate global thread index
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Utilize shared memory to minimize global memory access
    extern __shared__ int sharedData[];
    int *sA = sharedData;
    int *sB = sharedData + blockDim.x;

    // Load data into shared memory
    if (i < N) {
        sA[threadIdx.x] = A[i];
        sB[threadIdx.x] = B[i];
    }
    __syncthreads();

    // Perform computation using shared memory
    if (i < N) {
        C[i] = sA[threadIdx.x] + sB[threadIdx.x];
    }
}