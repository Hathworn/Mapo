#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void vecAddKernel(float *a, float *b, float *c, int n)
{
    // Calculate global thread ID
    int id = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure threads work only within vector bounds
    if (id < n) {
        c[id] = a[id] + b[id];
    }

    // Optimize memory access by using shared memory (if applicable)
    // __shared__ float sharedA[MAX_THREAD];
    // __shared__ float sharedB[MAX_THREAD];
    // sharedA[threadIdx.x] = a[id];
    // sharedB[threadIdx.x] = b[id];
    // __syncthreads();
    // if (id < n) {
    //     c[id] = sharedA[threadIdx.x] + sharedB[threadIdx.x];
    // }
}