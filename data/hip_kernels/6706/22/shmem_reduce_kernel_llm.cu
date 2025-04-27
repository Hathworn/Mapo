#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void shmem_reduce_kernel(float * d_out, const float * d_in)
{
    extern __shared__ float sdata[];

    int myId = threadIdx.x + blockDim.x * blockIdx.x;
    int tid  = threadIdx.x;

    // Load shared mem from global mem
    sdata[tid] = d_in[myId];
    __syncthreads();

    // Use loop unrolling for reduction in shared mem
    for (unsigned int s = blockDim.x / 2; s > 0; s >>= 1)
    {
        if (tid < s)
        {
            sdata[tid] += sdata[tid + s];
        }
        __syncthreads();
    }

    // Only thread 0 writes result for this block back to global mem
    if (tid == 0)
    {
        d_out[blockIdx.x] = sdata[0];
    }
}