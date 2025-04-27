#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void reduceInterleaved(int *g_idata, int *g_odata, unsigned int n)
{
    // set thread ID
    unsigned int tid = threadIdx.x;
    unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;

    // boundary check
    if (idx >= n) return;

    // Ensure no out-of-bounds access
    int sum = (idx < n) ? g_idata[idx] : 0;

    // perform reduction using shared memory to minimize global memory transactions
    __shared__ int sdata[1024]; // assuming blockDim.x <= 1024
    sdata[tid] = sum;
    __syncthreads();

    // unrolling the last warp to reduce __syncthreads overhead
    for (int stride = blockDim.x / 2; stride > 32; stride /= 2) {
        if (tid < stride) {
            sdata[tid] += sdata[tid + stride];
        }
        __syncthreads();
    }

    // unroll the last warp explicitly
    if (tid < 32) {
        volatile int* smem = sdata;
        smem[tid] += smem[tid + 32];
        smem[tid] += smem[tid + 16];
        smem[tid] += smem[tid + 8];
        smem[tid] += smem[tid + 4];
        smem[tid] += smem[tid + 2];
        smem[tid] += smem[tid + 1];
    }

    // write result for this block to global mem
    if (tid == 0) g_odata[blockIdx.x] = sdata[0];
}