#include "hip/hip_runtime.h"
#include "includes.h"
extern "C"

__global__ void norm1_strided_float(int n, int xOffset, float *dx, int incx, float *result) {
    // Use shared memory to accumulate results for each block
    __shared__ float shared_sum[256];
    int tid = threadIdx.x;
    shared_sum[tid] = 0;

    // Strided loop modified for better memory access patterns
    for (int i = blockIdx.x * blockDim.x + tid; i < n; i += blockDim.x * gridDim.x) {
        if (i >= xOffset && i % incx == 0) {
            shared_sum[tid] += fabsf(dx[i]);
        }
    }

    // Synchronize threads within the block
    __syncthreads();

    // Reduce partial results within the block
    if (tid < 128) shared_sum[tid] += shared_sum[tid + 128];
    __syncthreads();
    if (tid < 64) shared_sum[tid] += shared_sum[tid + 64];
    __syncthreads();

    // Unrolling the final warp for efficiency
    if (tid < 32) {
        shared_sum[tid] += shared_sum[tid + 32];
        shared_sum[tid] += shared_sum[tid + 16];
        shared_sum[tid] += shared_sum[tid + 8];
        shared_sum[tid] += shared_sum[tid + 4];
        shared_sum[tid] += shared_sum[tid + 2];
        shared_sum[tid] += shared_sum[tid + 1];
    }

    // Add block result to global result
    if (tid == 0) atomicAdd(result, shared_sum[0]);
}