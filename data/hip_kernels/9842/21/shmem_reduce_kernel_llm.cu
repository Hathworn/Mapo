#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void shmem_reduce_kernel(float *d_out, const float *d_in)
{
    extern __shared__ float sdata[];

    int myId = threadIdx.x + blockDim.x * blockIdx.x;
    int tid = threadIdx.x;

    // Load shared memory from global memory
    sdata[tid] = d_in[myId];
    __syncthreads();

    // Reduction in shared memory
    for (unsigned int s = blockDim.x / 2; s > 0; s >>= 1)
    {
        if (tid < s)
        {
            sdata[tid] += sdata[tid + s];
        }
        __syncthreads();
    }

    // Write result of this block to global memory
    if (tid == 0)
    {
        d_out[blockIdx.x] = sdata[0];
    }
}