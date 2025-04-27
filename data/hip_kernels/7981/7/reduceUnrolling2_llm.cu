#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void reduceUnrolling2(int *g_idata, int *g_odata, unsigned int n) {
    unsigned int tid = threadIdx.x;
    unsigned int idx = (2 * blockIdx.x) * blockDim.x + threadIdx.x;

    int *idata = g_idata + (2 * blockIdx.x) * blockDim.x;

    // Use shared memory to reduce global memory accesses
    extern __shared__ int sdata[];
    sdata[tid] = (idx < n) ? g_idata[idx] : 0;
    if (idx + blockDim.x < n) sdata[tid] += g_idata[idx + blockDim.x];

    __syncthreads();

    // Perform the reduction in shared memory
    for (unsigned int stride = blockDim.x / 2; stride > 0; stride >>= 1) {
        if (tid < stride) {
            sdata[tid] += sdata[tid + stride];
        }
        __syncthreads();
    }

    // Write the result for this block to global memory
    if (tid == 0) g_odata[blockIdx.x] = sdata[0];
}