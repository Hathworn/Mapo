#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void reduce0(float *g_idata, float *g_odata, int N) {
    extern __shared__ float sdata[];

    int tid = threadIdx.x;
    int i = blockIdx.x * (blockDim.x * 2) + threadIdx.x;
    
    // Load elements into shared memory; handle boundary
    float mySum = (i < N) ? g_idata[i] : 0.0f;
    if (i + blockDim.x < N) mySum += g_idata[i + blockDim.x];
    sdata[tid] = mySum;

    __syncthreads();

    // Unroll loop for faster reduction
    for (unsigned int s = blockDim.x / 2; s > 32; s >>= 1) {
        if (tid < s) {
            sdata[tid] += sdata[tid + s];
        }
        __syncthreads();
    }

    // Warp-level reduction
    if (tid < 32) {
        volatile float* smem = sdata;
        smem[tid] += smem[tid + 32];
        smem[tid] += smem[tid + 16];
        smem[tid] += smem[tid + 8];
        smem[tid] += smem[tid + 4];
        smem[tid] += smem[tid + 2];
        smem[tid] += smem[tid + 1];
    }

    // Write the result for this block to global memory
    if (tid == 0) g_odata[blockIdx.x] = sdata[0];
}