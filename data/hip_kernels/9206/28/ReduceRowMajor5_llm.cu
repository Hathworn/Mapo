#include "hip/hip_runtime.h"
#include "includes.h"

// Device function for warp reduction
__device__ void warpReduce(volatile int* sdata, int tid, int n) {
    if (tid + 32 < n) sdata[tid] += sdata[tid + 32];
    if (tid + 16 < n) sdata[tid] += sdata[tid + 16];
    if (tid + 8 < n) sdata[tid] += sdata[tid + 8];
    if (tid + 4 < n) sdata[tid] += sdata[tid + 4];
}

// Global kernel function optimized
__global__ void ReduceRowMajor5(int *g_idata, int *g_odata, int size) {
    unsigned int i = blockIdx.x * blockDim.x + threadIdx.x;
    unsigned int tid = threadIdx.x;
    extern __shared__ int sdata[];

    // Load data into shared memory
    sdata[tid] = (i < size) ? g_idata[i] : 0;
    __syncthreads();

    // Perform reduction in shared memory
    for (unsigned int s = blockDim.x / 2; s >= 32; s >>= 1) {
        if (tid < s) {
            sdata[tid] += sdata[tid + s];
        }
        __syncthreads();
    }

    // Perform warp reduction
    if (tid < 32) {
        warpReduce(sdata, tid, blockDim.x);
    }

    // Write result for this block to global memory
    if (tid == 0) {
        for (int j = 0; j < 4 && j < size; j++) {
            g_odata[blockIdx.x * 4 + j] = sdata[j];
        }
    }
}