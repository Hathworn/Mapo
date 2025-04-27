#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void reduceNeighbored (int *g_idata, int *g_odata, unsigned int n) {
    // Set thread ID
    unsigned int tid = threadIdx.x;
    unsigned int idx = blockIdx.x * blockDim.x + tid;

    // Boundary check
    if (idx >= n) return;

    // Using shared memory to reduce global memory accesses
    extern __shared__ int sdata[];
    sdata[tid] = g_idata[idx];
    __syncthreads();

    // In-place reduction in shared memory
    for (unsigned int stride = 1; stride < blockDim.x; stride *= 2) {
        if (tid % (2 * stride) == 0) {
            sdata[tid] += sdata[tid + stride];
        }
        __syncthreads(); // Synchronize within threadblock
    }

    // Write result for this block to global mem
    if (tid == 0) g_odata[blockIdx.x] = sdata[0];
}