#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void calculateResidual_CUDA(float *a, float *b, float *c) {
    extern __shared__ float se[]; // Use dynamic shared memory

    int tid = threadIdx.x;
    int bid = blockIdx.x;
    int n = blockDim.x;
    int index = tid + bid * n;

    // Calculate the absolute difference and store in shared memory
    se[tid] = fabsf(a[index] - b[index]);
    __syncthreads();

    // Reduction using binary tree algorithm
    for (int offset = n / 2; offset > 0; offset >>= 1) {
        if (tid < offset) {
            se[tid] += se[tid + offset];
        }
        __syncthreads();
    }

    // Atomic addition of the block's result to global memory
    if (tid == 0) {
        atomicAdd(c, se[0]);
    }
}