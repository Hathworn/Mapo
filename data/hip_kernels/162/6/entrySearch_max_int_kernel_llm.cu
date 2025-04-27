#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void entrySearch_max_int_kernel(int *g_iarr, int *g_maxarr, int size)
{
    // Create shared memory
    extern __shared__ int sarr_int[];

    // Calculate thread and block indices
    unsigned int tid = threadIdx.x;
    unsigned int i = blockIdx.x * (blockDim.x * 2) + threadIdx.x;

    // Load elements into shared memory
    int local_max = INT_MIN;
    if (i < size) {
        local_max = g_iarr[i];
        if (i + blockDim.x < size) {
            local_max = max(local_max, g_iarr[i + blockDim.x]);
        }
    }
    sarr_int[tid] = local_max;
    __syncthreads();

    // Parallel reduction in shared memory
    for (unsigned int s = blockDim.x / 2; s > 0; s >>= 1) {
        if (tid < s) {
            sarr_int[tid] = max(sarr_int[tid], sarr_int[tid + s]);
        }
        __syncthreads();
    }

    // Write result for this block to global memory
    if (tid == 0) {
        g_maxarr[blockIdx.x] = sarr_int[0];
    }
}