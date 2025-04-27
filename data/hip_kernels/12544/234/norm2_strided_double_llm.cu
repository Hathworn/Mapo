#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void norm2_strided_double(int n, int xOffset, double *dx, int incx, double *result) {
    // Use shared memory to accumulate results from threads
    __shared__ double sharedResult[256];
    int tid = threadIdx.x;
    sharedResult[tid] = 0.0;

    for (int i = blockIdx.x * blockDim.x + threadIdx.x; i < n; i += blockDim.x * gridDim.x) {
        if (i >= xOffset && i % incx == 0) {
            sharedResult[tid] += dx[i] * dx[i];
        }
    }

    // Synchronize threads before reduction
    __syncthreads();

    // Reduce within the block to calc block partial sum
    if (tid < 128) sharedResult[tid] += sharedResult[tid + 128];
    __syncthreads();
    if (tid < 64) sharedResult[tid] += sharedResult[tid + 64];
    __syncthreads();
    if (tid < 32) {
        sharedResult[tid] += sharedResult[tid + 32];
        sharedResult[tid] += sharedResult[tid + 16];
        sharedResult[tid] += sharedResult[tid + 8];
        sharedResult[tid] += sharedResult[tid + 4];
        sharedResult[tid] += sharedResult[tid + 2];
        sharedResult[tid] += sharedResult[tid + 1];
    }

    // Write block result to global memory
    if (tid == 0) atomicAdd(result, sharedResult[0]);
}