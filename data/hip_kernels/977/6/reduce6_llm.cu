#include "hip/hip_runtime.h"
#include "includes.h"

template <unsigned int blockSize>
__device__ void warpReduce(volatile int* sdata, int tid) {
    if (blockSize >= 64) sdata[tid] += sdata[tid + 32];
    if (blockSize >= 32) sdata[tid] += sdata[tid + 16];
    if (blockSize >= 16) sdata[tid] += sdata[tid + 8];
    if (blockSize >= 8) sdata[tid] += sdata[tid + 4];
    if (blockSize >= 4) sdata[tid] += sdata[tid + 2];
    if (blockSize >= 2) sdata[tid] += sdata[tid + 1];
}

template <unsigned int blockSize>
__global__ void reduce6(int *g_idata, int *g_odata, int n) {
    extern __shared__ int sdata[];

    // Calculate thread and grid indices
    unsigned int tid = threadIdx.x;
    unsigned int i = blockIdx.x * (blockSize * 2) + threadIdx.x;
    unsigned int gridSize = blockSize * 2 * gridDim.x;
    
    // Initialize shared memory to zero
    int sum = 0;
    while (i < n) {
        // Perform first level of reduction in registers
        sum += g_idata[i] + g_idata[i + blockSize];
        i += gridSize; // Move to the next portion
    }
    sdata[tid] = sum; // Store thread's reduce result in shared memory
    __syncthreads();

    // Unrolled reduction in shared memory with syncthreads barrier
    if (blockSize >= 512) { if (tid < 256) sdata[tid] += sdata[tid + 256]; __syncthreads(); }
    if (blockSize >= 256) { if (tid < 128) sdata[tid] += sdata[tid + 128]; __syncthreads(); }
    if (blockSize >= 128) { if (tid < 64) sdata[tid] += sdata[tid + 64]; __syncthreads(); }
    
    // Warp reduce for the last 32 threads
    if (tid < 32) warpReduce<blockSize>(sdata, tid);

    // Write the block's result to global memory
    if (tid == 0) g_odata[blockIdx.x] = sdata[0];
}