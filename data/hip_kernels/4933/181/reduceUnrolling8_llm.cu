#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void reduceUnrolling8(int *g_idata, int *g_odata, unsigned int n) {
    // Set thread ID
    unsigned int tid = threadIdx.x;
    unsigned int idx = blockIdx.x * blockDim.x * 8 + threadIdx.x;

    // Convert global data pointer to the local pointer of this block
    int *idata = g_idata + blockIdx.x * blockDim.x * 8;

    // Check bounds and perform unrolled reduction
    int sum = 0;
    if (idx < n) {
        sum += g_idata[idx];
        if (idx + blockDim.x < n) sum += g_idata[idx + blockDim.x];
        if (idx + 2 * blockDim.x < n) sum += g_idata[idx + 2 * blockDim.x];
        if (idx + 3 * blockDim.x < n) sum += g_idata[idx + 3 * blockDim.x];
        if (idx + 4 * blockDim.x < n) sum += g_idata[idx + 4 * blockDim.x];
        if (idx + 5 * blockDim.x < n) sum += g_idata[idx + 5 * blockDim.x];
        if (idx + 6 * blockDim.x < n) sum += g_idata[idx + 6 * blockDim.x];
        if (idx + 7 * blockDim.x < n) sum += g_idata[idx + 7 * blockDim.x];
    }
    idata[tid] = sum;

    __syncthreads();

    // In-place reduction in shared memory
    for (int stride = blockDim.x / 2; stride > 0; stride >>= 1) {
        if (tid < stride) {
            idata[tid] += idata[tid + stride];
        }
        __syncthreads(); // Synchronize within threadblock
    }

    // Write result for this block to global memory
    if (tid == 0) g_odata[blockIdx.x] = idata[0];
}