#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void reduceSmem(int *g_idata, int *g_odata, unsigned int n)
{
    // Use dynamically allocated shared memory for flexible block size
    extern __shared__ int smem[];

    // Set thread ID
    unsigned int tid = threadIdx.x;

    // Boundary check
    unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    if (idx >= n) return;

    // Convert global data pointer to the local pointer of this block
    int *idata = g_idata + blockIdx.x * blockDim.x;

    // Load data into shared memory
    smem[tid] = idata[tid];
    __syncthreads();

    // Reduce shared memory using loop unrolling for better performance
    for (unsigned int s = blockDim.x / 2; s > 32; s >>= 1) {
        if (tid < s) {
            smem[tid] += smem[tid + s];
        }
        __syncthreads(); // Sync at each step
    }

    // Unrolled reduction for last warp
    if (tid < 32) {
        volatile int *vsmem = smem;
        vsmem[tid] += vsmem[tid + 32];
        vsmem[tid] += vsmem[tid + 16];
        vsmem[tid] += vsmem[tid + 8];
        vsmem[tid] += vsmem[tid + 4];
        vsmem[tid] += vsmem[tid + 2];
        vsmem[tid] += vsmem[tid + 1];
    }

    // Write result for this block to global memory
    if (tid == 0) g_odata[blockIdx.x] = smem[0];
}