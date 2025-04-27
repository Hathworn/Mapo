#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void reduceUnrolling2(int *g_idata, int *g_odata, unsigned int n)
{
    // Set thread ID
    unsigned int tid = threadIdx.x;
    unsigned int idx = blockIdx.x * blockDim.x * 2 + threadIdx.x;

    // Convert global data pointer to the local pointer of this block
    int *idata = g_idata + blockIdx.x * blockDim.x * 2;

    // Unrolling 2
    int temp = 0;
    if (idx < n) temp = idata[tid];
    if (idx + blockDim.x < n) temp += idata[tid + blockDim.x]; 

    __syncthreads();

    // In-place reduction using shared memory
    __shared__ int sdata[1024]; // Assuming blockDim.x <= 1024
    sdata[tid] = temp;
    __syncthreads();

    // Parallel reduction with shared memory
    for (int stride = blockDim.x / 2; stride > 0; stride >>= 1)
    {
        if (tid < stride)
        {
            sdata[tid] += sdata[tid + stride];
        }
        __syncthreads();
    }

    // Write result for this block to global memory
    if (tid == 0) g_odata[blockIdx.x] = sdata[0];
}