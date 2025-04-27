#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void reduce0(float *g_idata, float *g_odata, int N) {
    extern __shared__ float sdata[];

    // Load elements from global memory to shared memory
    int tid = threadIdx.x;
    int i = blockIdx.x * blockDim.x * 2 + threadIdx.x;
    float sum = 0.0;

    if (i < N) sum = g_idata[i];
    if (i + blockDim.x < N) sum += g_idata[i + blockDim.x];

    sdata[tid] = sum;
    __syncthreads();

    // Perform reduction in shared memory
    for (unsigned int s = blockDim.x / 2; s > 32; s >>= 1) {
        if (tid < s) {
            sdata[tid] += sdata[tid + s];
        }
        __syncthreads();
    }

    // Unrolling loop for last warp
    if (tid < 32) {
        volatile float* smem = sdata;  // Use volatile to optimize
        smem[tid] += smem[tid + 32];
        smem[tid] += smem[tid + 16];
        smem[tid] += smem[tid + 8];
        smem[tid] += smem[tid + 4];
        smem[tid] += smem[tid + 2];
        smem[tid] += smem[tid + 1];
    }

    // Write result for this block to global memory
    if (tid == 0) g_odata[blockIdx.x] = sdata[0];
}