#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void reduceSmemUnrollDyn(int *g_idata, int *g_odata, unsigned int n)
{
    extern __shared__ int smem[];

    // Set thread ID
    unsigned int tid = threadIdx.x;
    unsigned int idx = blockIdx.x * blockDim.x * 4 + threadIdx.x;

    // Unrolling 4 and boundary check combined 
    int tmpSum = 0;
    if (idx < n) tmpSum += g_idata[idx];
    if (idx + blockDim.x < n) tmpSum += g_idata[idx + blockDim.x];
    if (idx + 2 * blockDim.x < n) tmpSum += g_idata[idx + 2 * blockDim.x];
    if (idx + 3 * blockDim.x < n) tmpSum += g_idata[idx + 3 * blockDim.x];

    smem[tid] = tmpSum;
    __syncthreads();

    // In-place reduction using loop to reduce unroll duplication 
    for (unsigned int s = blockDim.x / 2; s > 32; s >>= 1) {
        if (tid < s) {
            smem[tid] += smem[tid + s];
        }
        __syncthreads();
    }

    // Unrolling warp
    if (tid < 32) {
        volatile int *vsmem = smem;
        vsmem[tid] += vsmem[tid + 32];
        vsmem[tid] += vsmem[tid + 16];
        vsmem[tid] += vsmem[tid + 8];
        vsmem[tid] += vsmem[tid + 4];
        vsmem[tid] += vsmem[tid + 2];
        vsmem[tid] += vsmem[tid + 1];
    }

    // Write result for this block to global mem
    if (tid == 0) g_odata[blockIdx.x] = smem[0];
}