#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void norm1_strided_double(int n, int xOffset, double *dx, int incx, double *result) {
    // Create shared memory to reduce atomic operations overhead
    extern __shared__ double sharedResult[];
    int tid = threadIdx.x;
    sharedResult[tid] = 0.0;

    // Traverse elements with strided pattern
    for (int i = blockIdx.x * blockDim.x + threadIdx.x; i < n; i += blockDim.x * gridDim.x) {
        if (i >= xOffset && i % incx == 0) {
            sharedResult[tid] += abs(dx[i]);
        }
    }

    // Synchronize threads within the block
    __syncthreads();

    // Use parallel reduction to sum results within a block
    for (int stride = blockDim.x / 2; stride > 0; stride /= 2) {
        if (tid < stride) {
            sharedResult[tid] += sharedResult[tid + stride];
        }
        __syncthreads();
    }

    // Update global result with result from block 0 thread 0
    if (tid == 0) {
        atomicAdd(result, sharedResult[0]);
    }
}