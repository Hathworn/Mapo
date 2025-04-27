#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void reduceSmem(int *g_idata, int *g_odata, unsigned int n)
{
    __shared__ int smem[DIM];

    // Set thread ID
    unsigned int tid = threadIdx.x;

    // Boundary check
    unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    if (idx >= n) return;

    // Convert global data pointer to the local pointer of this block
    int *idata = g_idata + blockIdx.x * blockDim.x;

    // Set to smem by each thread
    smem[tid] = (idx < n) ? idata[tid] : 0; // Check boundary condition
    __syncthreads();

    // In-place reduction in shared memory
    for (unsigned int s = blockDim.x / 2; s > 32; s >>= 1) {
        if (tid < s) smem[tid] += smem[tid + s]; // Reduce within block
        __syncthreads();
    }

    // Unrolling warp
    if (tid < 32) {
        volatile int *vsmem = smem;
        vsmem[tid] += vsmem[tid + 32];
        vsmem[tid] += vsmem[tid + 16];
        vsmem[tid] += vsmem[tid +  8];
        vsmem[tid] += vsmem[tid +  4];
        vsmem[tid] += vsmem[tid +  2];
        vsmem[tid] += vsmem[tid +  1];
    }

    // Write result for this block to global memory
    if (tid == 0) g_odata[blockIdx.x] = smem[0];
}