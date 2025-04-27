#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void global_reduce_kernel(float * d_out, float * d_in)
{
    extern __shared__ float sdata[]; // shared memory for in-block reduction
    int myId = threadIdx.x + blockDim.x * blockIdx.x;
    int tid  = threadIdx.x;

    // Load input into shared memory
    sdata[tid] = d_in[myId];
    __syncthreads(); // ensure all loads are done

    // Optimize reduction by keeping data in shared memory
    for (unsigned int s = blockDim.x / 2; s > 0; s >>= 1)
    {
        if (tid < s)
        {
            sdata[tid] += sdata[tid + s];
        }
        __syncthreads(); // ensure all adds are done
    }

    // Write result for this block to global memory
    if (tid == 0)
    {
        d_out[blockIdx.x] = sdata[0];
    }
}