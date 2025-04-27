#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void warmup(float *A, float *B, float *C, const int n, int offset)
{
    unsigned int i = blockIdx.x * blockDim.x + threadIdx.x;
    unsigned int k = i + offset;

    // Ensure k is within bounds and utilize shared memory for faster access
    if (k < n) {
        extern __shared__ float sdata[];
        sdata[threadIdx.x] = A[i] + B[i]; // Load to shared memory
        __syncthreads(); // Ensure all loads to shared memory are complete
        C[k] = sdata[threadIdx.x]; // Store result from shared memory to global memory
    }
}