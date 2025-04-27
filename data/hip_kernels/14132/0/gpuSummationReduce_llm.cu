#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void gpuSummationReduce(float *in, float *out, int n)
{
    extern __shared__ float sdata[];

    // Load shared memory
    unsigned int tid = threadIdx.x;
    unsigned int i = blockIdx.x * blockDim.x + threadIdx.x;

    sdata[tid] = (i < n) ? in[i] : 0;
    __syncthreads();

    // Optimized reduction in shared memory using contiguous threads
    for (unsigned int s = blockDim.x / 2; s > 0; s >>= 1)
    {
        if (tid < s)
        {
            sdata[tid] += sdata[tid + s]; // Efficient reduction
        }
        __syncthreads();
    }

    // Write result for this block to global memory
    if (tid == 0) out[blockIdx.x] = sdata[0];
}