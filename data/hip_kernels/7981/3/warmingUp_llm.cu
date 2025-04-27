#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void warmingUp(int *g_idata, int *g_odata, unsigned int n) {
    unsigned int tid = threadIdx.x;
    unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Boundary check
    if (idx >= n) return;

    // Shared memory for better data access
    extern __shared__ int smem[];
    smem[tid] = g_idata[idx];
    __syncthreads();

    // Use shared memory to perform reduction
    for (int stride = 1; stride < blockDim.x; stride <<= 1) {
        int index = 2 * stride * tid;
        if (index < blockDim.x) {
            smem[index] += smem[index + stride];
        }
        __syncthreads();
    }

    // Write result to global memory
    if (tid == 0) {
        g_odata[blockIdx.x] = smem[0];
    }
}