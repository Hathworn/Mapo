#include "hip/hip_runtime.h"
#include "includes.h"
#define N 1024*4

// Device Kernel
__global__ void amean(float *A, float *S)
{
    // Use shared memory for efficient data reduction
    extern __shared__ float sdata[];

    int tid = threadIdx.x;
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    sdata[tid] = A[i];
    __syncthreads();

    // Perform reduction using less synchronization
    for (unsigned int s = blockDim.x / 2; s > 0; s >>= 1) {
        if (tid < s) {
            sdata[tid] += sdata[tid + s];
        }
        __syncthreads();
    }

    // Write result for this block to global memory
    if (tid == 0) {
        S[blockIdx.x] = sdata[0];
    }
}