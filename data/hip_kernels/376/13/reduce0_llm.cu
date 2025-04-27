#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void reduce0(float *g_idata, float *g_odata, int N) {
    extern __shared__ float sdata[];

    // Each thread loads one element from global to shared memory
    int tid = threadIdx.x;
    int i = blockIdx.x * (blockDim.x * 2) + threadIdx.x;
    float mySum = (i < N) ? g_idata[i] : 0.0f;
    if ((i + blockDim.x) < N) mySum += g_idata[i + blockDim.x];
    sdata[tid] = mySum;
    __syncthreads();

    // Optimize reduction using warp-level operations
    for (unsigned int s = blockDim.x / 2; s > 32; s >>= 1) {
        if (tid < s) {
            sdata[tid] += sdata[tid + s];
        }
        __syncthreads();
    }

    if (tid < 32) {
        // Unrolling the last warp
        mySum = sdata[tid] + sdata[tid + 32];
        mySum += sdata[tid + 16];
        mySum += sdata[tid + 8];
        mySum += sdata[tid + 4];
        mySum += sdata[tid + 2];
        mySum += sdata[tid + 1];
        sdata[tid] = mySum;
    }

    // Write result for this block to global memory
    if (tid == 0) g_odata[blockIdx.x] = sdata[0];
}