#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void global_reduce_kernel(float * d_out, float * d_in)
{
    // Using shared memory for intra-block reduction
    extern __shared__ float sdata[];

    int myId = threadIdx.x + blockDim.x * blockIdx.x;
    int tid = threadIdx.x;

    // Load input into shared memory
    sdata[tid] = d_in[myId];
    __syncthreads();

    // Do reduction in shared memory
    for (unsigned int s = blockDim.x / 2; s > 0; s >>= 1)
    {
        if (tid < s)
        {
            sdata[tid] += sdata[tid + s];
        }
        __syncthreads(); // Ensure all threads complete current stage
    }

    // Only thread 0 writes result for this block back to global memory
    if (tid == 0)
    {
        d_out[blockIdx.x] = sdata[0];
    }
}