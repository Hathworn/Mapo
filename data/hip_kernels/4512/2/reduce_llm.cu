#include "hip/hip_runtime.h"
#include "includes.h"

extern "C"
__global__ void reduce(float *g_idata, float *g_odata, unsigned int n)
{
    extern __shared__ float sdata[];

    // First level reduction: global to shared memory
    unsigned int tid = threadIdx.x;
    unsigned int i = blockIdx.x*blockDim.x*2 + tid;
    unsigned int gridSize = blockDim.x*2*gridDim.x;

    float mySum = 0;

    // Unroll loop for better performance
    while (i < n) {
        mySum += g_idata[i];
        if (i + blockDim.x < n) mySum += g_idata[i+blockDim.x];
        i += gridSize;
    }

    // Store local sum in shared memory
    sdata[tid] = mySum;
    __syncthreads();

    // Reduce in shared memory
    for (unsigned int s = blockDim.x / 2; s > 32; s >>= 1) {
        if (tid < s) {
            sdata[tid] += sdata[tid + s];
        }
        __syncthreads();
    }

    // Warp reduction (no synchronization needed within a warp)
    if (tid < 32) {
        volatile float* smem = sdata;  // Declare as volatile
        smem[tid] += smem[tid + 32];
        smem[tid] += smem[tid + 16];
        smem[tid] += smem[tid + 8];
        smem[tid] += smem[tid + 4];
        smem[tid] += smem[tid + 2];
        smem[tid] += smem[tid + 1];
    }

    // Write result to global memory
    if (tid == 0) g_odata[blockIdx.x] = sdata[0];
}