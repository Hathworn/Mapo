#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void entrySearch_max_int_kernel(int *g_iarr, int *g_maxarr, int size) {
    // Create shared memory
    extern __shared__ int sarr_int[];

    // Load shared mem
    unsigned int tid = threadIdx.x;
    unsigned int i = blockIdx.x * blockDim.x * 2 + threadIdx.x;

    // Use a single load instead of conditional statements
    sarr_int[tid] = (i < size) ? g_iarr[i] : INT_MIN;
    if (i + blockDim.x < size) {
        sarr_int[tid] = max(sarr_int[tid], g_iarr[i + blockDim.x]);
    }

    __syncthreads();

    // Do comparison in shared mem
    for (unsigned int s = blockDim.x / 2; s > 0; s >>= 1) {
        if (tid < s) {
            sarr_int[tid] = max(sarr_int[tid], sarr_int[tid + s]);
        }
        __syncthreads();
    }

    // Write result for this block to global mem
    if (tid == 0) {
        g_maxarr[blockIdx.x] = sarr_int[0];
    }
}