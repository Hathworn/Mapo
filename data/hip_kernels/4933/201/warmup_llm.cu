#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void warmup(float *A, float *B, float *C, const int n, int offset)
{
    // Use shared memory to minimize global memory accesses
    extern __shared__ float sharedMem[];
    unsigned int i = blockIdx.x * blockDim.x + threadIdx.x;
    unsigned int k = i + offset;

    // Ensure thread index is within bounds
    if (i < n && k < n) {
        sharedMem[threadIdx.x] = A[k] + B[k]; // Load data to shared memory
        __syncthreads(); // Sync threads to ensure completion of shared memory loads

        C[i] = sharedMem[threadIdx.x]; // Write result back to global memory
    }
}