#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void reduceNeighboredSmem(int *g_idata, int *g_odata, unsigned int n)
{
    extern __shared__ int smem[]; // Use dynamic shared memory

    // Set thread ID and block starting index
    unsigned int tid = threadIdx.x;
    unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Boundary check
    if (idx >= n) return;

    // Load elements into shared memory with bounds check
    smem[tid] = (tid < blockDim.x) ? g_idata[idx] : 0;
    __syncthreads();

    // In-place reduction using shared memory
    for (int stride = 1; stride < blockDim.x; stride *= 2)
    {
        int index = 2 * stride * tid;

        if (index < blockDim.x)
        {
            smem[index] += smem[index + stride];
        }
        
        __syncthreads();
    }

    // Write result for this block to global memory
    if (tid == 0) g_odata[blockIdx.x] = smem[0];
}