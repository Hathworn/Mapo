#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void reduceInterleave(int *g_idata, int *g_odata, unsigned int n) {
    // Thread id
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    // Data pointer of this block
    int *idata = g_idata + blockIdx.x * blockDim.x;

    // Thread id out of range
    if (idx >= n) return;

    int tid = threadIdx.x; // Cache thread index

    // Present as reduction in shared memory
    extern __shared__ int sdata[];
    sdata[tid] = idata[tid];
    __syncthreads();

    // Loop unrolling for stride 2 optimization
    for (int stride = blockDim.x / 2; stride > 0; stride >>= 1) {
        if (tid < stride) {
            sdata[tid] += sdata[tid + stride];
        }
        __syncthreads();
    }

    // Write the result for this block to global memory
    if (tid == 0) {
        g_odata[blockIdx.x] = sdata[0];
    }
}