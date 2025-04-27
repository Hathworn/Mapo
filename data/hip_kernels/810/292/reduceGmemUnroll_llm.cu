#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void reduceGmemUnroll(int *g_idata, int *g_odata, unsigned int n)
{
    // Set thread ID
    unsigned int tid = threadIdx.x;
    unsigned int idx = blockIdx.x * blockDim.x * 4 + threadIdx.x;
    
    // Convert global data pointer to the local pointer of this block
    int *idata = g_idata + blockIdx.x * blockDim.x * 4;

    // Unrolling 4
    int mySum = 0;
    if (idx + 3 * blockDim.x < n) {
        mySum = g_idata[idx] + g_idata[idx + blockDim.x] + 
                g_idata[idx + 2 * blockDim.x] + g_idata[idx + 3 * blockDim.x];
    }
    
    // Store the sum in shared memory
    idata[tid] = mySum;
    __syncthreads();

    // In-place reduction in global memory
    for (unsigned int s = blockDim.x / 2; s > 32; s >>= 1) {
        if (tid < s) idata[tid] += idata[tid + s];
        __syncthreads();
    }

    // Unrolling warp
    if (tid < 32) {
        volatile int *vsmem = idata;
        vsmem[tid] += vsmem[tid + 32];
        vsmem[tid] += vsmem[tid + 16];
        vsmem[tid] += vsmem[tid + 8];
        vsmem[tid] += vsmem[tid + 4];
        vsmem[tid] += vsmem[tid + 2];
        vsmem[tid] += vsmem[tid + 1];
    }

    // Write result for this block to global memory
    if (tid == 0) g_odata[blockIdx.x] = idata[0];
}