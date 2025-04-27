#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void ladKernel(float *a, float *b, float *out, int size) {
    extern __shared__ float sdata[];
    unsigned int tid = threadIdx.x;
    unsigned int i = blockIdx.x * (blockDim.x * 2) + threadIdx.x;
    int stride = blockDim.x * 2 * gridDim.x;
    sdata[tid] = 0;

    // Unrolling the loop for performance improvement
    while (i < size) {
        sdata[tid] += abs(a[i] - b[i]) + abs(a[i + blockDim.x] - b[i + blockDim.x]);
        i += stride;
    }
    __syncthreads();

    // Optimize reduction process
    for (unsigned int s = blockDim.x / 2; s > 32; s >>= 1) {
        if (tid < s) {
            sdata[tid] += sdata[tid + s];
        }
        __syncthreads();
    }

    // Unrolling warp reduction
    if (tid < 32) {
        volatile float* smem = sdata; // Use volatile to prevent reordering
        smem[tid] += smem[tid + 32];
        smem[tid] += smem[tid + 16];
        smem[tid] += smem[tid + 8];
        smem[tid] += smem[tid + 4];
        smem[tid] += smem[tid + 2];
        smem[tid] += smem[tid + 1];
    }
    
    if (tid == 0) {
        out[blockIdx.x] = sdata[0];
    }
}