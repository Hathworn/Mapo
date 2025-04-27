#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void reduceUnrolling2 (int *g_idata, int *g_odata, unsigned int n)
{
    // set thread ID
    unsigned int tid = threadIdx.x;
    unsigned int idx = blockIdx.x * blockDim.x * 2 + threadIdx.x;

    // convert global data pointer to the local pointer of this block
    int *idata = g_idata + blockIdx.x * blockDim.x * 2;

    // unrolling 2
    int sum = 0;
    if (idx < n) sum = g_idata[idx];
    if (idx + blockDim.x < n) sum += g_idata[idx + blockDim.x];

    // in-place reduction in shared memory
    __shared__ int smem[512];  // Assuming blockDim.x <= 512
    smem[tid] = sum;
    __syncthreads();

    // unrolled loop for reduction
    for (int stride = blockDim.x / 2; stride > 0; stride >>= 1)
    {
        if (tid < stride)
        {
            smem[tid] += smem[tid + stride];
        }
        __syncthreads();
    }

    // write result for this block to global mem
    if (tid == 0) g_odata[blockIdx.x] = smem[0];
}