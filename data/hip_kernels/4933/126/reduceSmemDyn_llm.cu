#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void reduceSmemDyn(int *g_idata, int *g_odata, unsigned int n)
{
    extern __shared__ int smem[];

    // set thread ID
    unsigned int tid = threadIdx.x;

    // Improve memory coalescing by accessing contiguous memory
    int index = blockIdx.x * blockDim.x + tid;
    if (index < n) {
        smem[tid] = g_idata[index];
    } else {
        smem[tid] = 0; // Initialize out-of-bound threads to 0
    }
    __syncthreads();

    // in-place reduction in shared memory with loop unrolling
    for (unsigned int s = blockDim.x / 2; s > 32; s >>= 1) {
        if (tid < s) {
            smem[tid] += smem[tid + s];
        }
        __syncthreads();
    }

    // Unrolling last warp without __syncthreads
    if (tid < 32)
    {
        volatile int *vsmem = smem;
        vsmem[tid] += vsmem[tid + 32];
        vsmem[tid] += vsmem[tid + 16];
        vsmem[tid] += vsmem[tid + 8];
        vsmem[tid] += vsmem[tid + 4];
        vsmem[tid] += vsmem[tid + 2];
        vsmem[tid] += vsmem[tid + 1];
    }

    // write result for this block to global memory
    if (tid == 0) g_odata[blockIdx.x] = smem[0];
}