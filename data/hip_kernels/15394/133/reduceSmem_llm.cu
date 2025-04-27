#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void reduceSmem (int *g_idata, int *g_odata, unsigned int n)
{
    __shared__ int smem[DIM];

    // set thread ID
    unsigned int tid = threadIdx.x;

    // boundary check
    unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    if (idx >= n) return;

    // convert global data pointer to the local pointer of this block
    int *idata = g_idata + blockIdx.x * blockDim.x;

    // set to smem by each thread
    smem[tid] = idata[tid];
    __syncthreads();

    // In-place reduction in shared memory with loop unrolling
    for (unsigned int s = blockDim.x / 2; s > 32; s >>= 1) {
        if (tid < s) smem[tid] += smem[tid + s];
        __syncthreads();
    }

    // Unrolling last warp
    if (tid < 32) {
        volatile int *vsmem = smem; // Use volatile to prevent compiler optimization
        vsmem[tid] += vsmem[tid + 32];
        vsmem[tid] += vsmem[tid + 16];
        vsmem[tid] += vsmem[tid +  8];
        vsmem[tid] += vsmem[tid +  4];
        vsmem[tid] += vsmem[tid +  2];
        vsmem[tid] += vsmem[tid +  1];
    }

    // write result for this block to global memory
    if (tid == 0) g_odata[blockIdx.x] = smem[0];
}