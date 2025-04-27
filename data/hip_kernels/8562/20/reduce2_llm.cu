#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void reduce2(float *in, float *out, int n)
{
    extern __shared__ float sdata[];

    // load shared mem
    unsigned int tid = threadIdx.x;
    unsigned int i = blockIdx.x * blockDim.x + threadIdx.x;

    sdata[tid] = (i < n) ? in[i] : 0;

    __syncthreads();

    // do reduction in shared mem
    for (unsigned int s = blockDim.x / 2; s > 0; s >>= 1) // use bitwise operations for efficient division
    {
        if (tid < s) // only half the threads need to read and write
        {
            sdata[tid] += sdata[tid + s];
        }
        __syncthreads();
    }

    // write result for this block to global mem
    if (tid == 0) out[blockIdx.x] = sdata[0];
}