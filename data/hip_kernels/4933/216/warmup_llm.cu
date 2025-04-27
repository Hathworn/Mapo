#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void warmup(float *A, float *B, float *C, const int n, int offset)
{
    unsigned int i = blockIdx.x * blockDim.x + threadIdx.x;
    unsigned int k = i + offset;

    // Use shared memory for frequently accessed data
    extern __shared__ float sharedMem[];

    if (k < n) {
        sharedMem[threadIdx.x] = A[k] + B[k];
        __syncthreads(); // Ensure all writes to shared memory are complete
        C[i] = sharedMem[threadIdx.x]; // Write result to global memory
    }
}