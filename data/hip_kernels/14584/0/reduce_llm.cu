#include "hip/hip_runtime.h"
#include "includes.h"

extern "C"
__global__ void reduce(float *g_idata, float *g_odata, unsigned int n) {
    extern __shared__ float sdata[];

    unsigned int tid = threadIdx.x;
    unsigned int i = blockIdx.x * blockDim.x * 2 + threadIdx.x;
    unsigned int gridSize = blockDim.x * 2 * gridDim.x;

    float mySum = 0;

    // Loop unrolled to improve memory coalescing
    if (i < n) mySum = g_idata[i];
    if (i + blockDim.x < n) mySum += g_idata[i + blockDim.x];
    i += gridSize;

    // Store the local sum in shared memory
    sdata[tid] = mySum;
    __syncthreads();

    // Reduce in shared memory using coalesced access
    for (unsigned int s = blockDim.x / 2; s > 32; s >>= 1) {
        if (tid < s) {
            sdata[tid] += sdata[tid + s];
        }
        __syncthreads();
    }

    // Unrolling the last warp
    if (tid < 32) {
        volatile float *smem = sdata;
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