#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void reduceCompleteUnrollWarps8 (int *g_idata, int *g_odata, unsigned int n)
{
    // Set thread ID
    unsigned int tid = threadIdx.x;
    unsigned int idx = blockIdx.x * blockDim.x * 8 + threadIdx.x;

    // Convert global data pointer to the local pointer of this block
    int *idata = g_idata + blockIdx.x * blockDim.x * 8;

    // Unroll and sum 8 elements at once if within bounds
    if (idx + 7 * blockDim.x < n)
    {
        int sum = 0;
        for (int i = 0; i < 8; i++)
        {
            sum += g_idata[idx + i * blockDim.x]; // Efficient unrolling with loop
        }
        g_idata[idx] = sum;
    }

    __syncthreads();

    // In-place reduction using loop for simplicity and readability
    for (int s = blockDim.x / 2; s > 32; s >>= 1)
    {
        if (tid < s) 
        {
            idata[tid] += idata[tid + s];
        }
        __syncthreads();
    }

    // Unrolling warp for efficiency
    if (tid < 32)
    {
        volatile int *vsmem = idata;
        vsmem[tid] += vsmem[tid + 32];
        vsmem[tid] += vsmem[tid + 16];
        vsmem[tid] += vsmem[tid +  8];
        vsmem[tid] += vsmem[tid +  4];
        vsmem[tid] += vsmem[tid +  2];
        vsmem[tid] += vsmem[tid +  1];
    }

    // Write result for this block to global memory
    if (tid == 0) g_odata[blockIdx.x] = idata[0];
}