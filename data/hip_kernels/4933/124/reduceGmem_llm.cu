#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void reduceGmem(int *g_idata, int *g_odata, unsigned int n)
{
    // Set thread ID
    unsigned int tid = threadIdx.x;
    int *idata = g_idata + blockIdx.x * blockDim.x;
    
    // Boundary check
    unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    if (idx >= n) return;

    // Use loops instead of unrolling for better performance and scalability
    for (unsigned int offset = blockDim.x / 2; offset > 0; offset >>= 1) {
        if (tid < offset) {
            idata[tid] += idata[tid + offset];
        }
        __syncthreads(); // Ensure all threads have completed
    }

    // Write result for this block to global mem
    if (tid == 0) g_odata[blockIdx.x] = idata[0];
}