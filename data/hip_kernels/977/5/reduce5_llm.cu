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

__global__ void reduce5(int* g_idata, int* g_odata) {
    extern __shared__ int sdata[];
    // Efficient indexing variables
    unsigned int tid = threadIdx.x;
    unsigned int i = blockIdx.x * (blockDim.x * 2) + threadIdx.x;
    
    // Use less divergent memory access
    if (i + blockDim.x < gridDim.x * blockDim.x) {
        sdata[tid] = g_idata[i] + g_idata[i + blockDim.x];
    } else {
        sdata[tid] = g_idata[i]; // Handle incomplete final block
    }
    __syncthreads();

    // Unroll the reduction loop
    if (blockSize >= 512) {
        if (tid < 256) { sdata[tid] += sdata[tid + 256]; } __syncthreads();
    }
    if (blockSize >= 256) {
        if (tid < 128) { sdata[tid] += sdata[tid + 128]; } __syncthreads();
    }
    if (blockSize >= 128) {
        if (tid < 64) { sdata[tid] += sdata[tid + 64]; } __syncthreads();
    }

    // Efficient warp reduce function
    if (tid < 32) warpReduce<blockSize>(sdata, tid);

    // Write the final result to global memory
    if (tid == 0) g_odata[blockIdx.x] = sdata[0];
}