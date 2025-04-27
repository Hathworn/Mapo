#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void reduceUnrolling (int *g_idata, int *g_odata, unsigned int n, unsigned int q)
{
    // set thread ID
    unsigned int tid = threadIdx.x;
    unsigned int idx = blockIdx.x * blockDim.x * q + threadIdx.x;

    // Unroll loop and accumulate
    for (int i = 0; i < q && idx + blockDim.x * i < n; i++) {
        g_idata[idx] += g_idata[idx + blockDim.x * i];
    } 
    __syncthreads();

    // Reduction in shared memory
    for (int stride = blockDim.x / 2; stride > 0; stride /= 2) {
        if (tid < stride) {
            g_idata[idx] += g_idata[idx + stride];
        }
        __syncthreads(); // Ensure all threads have completed the stride addition
    }

    // Write result for this block to global mem
    if (tid == 0) {
        g_odata[blockIdx.x] = g_idata[idx];
    }
}