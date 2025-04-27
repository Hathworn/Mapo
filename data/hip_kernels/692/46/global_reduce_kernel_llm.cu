#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void global_reduce_kernel(float * d_out, float * d_in)
{
    int myId = threadIdx.x + blockDim.x * blockIdx.x;
    int tid  = threadIdx.x;
    
    // Load input into shared memory for fast access
    extern __shared__ float sdata[];
    sdata[tid] = d_in[myId];
    __syncthreads();
    
    // Perform reduction in shared memory
    for (unsigned int s = blockDim.x / 2; s > 0; s >>= 1)
    {
        if (tid < s)
        {
            sdata[tid] += sdata[tid + s];
        }
        __syncthreads(); // Ensure all threads have completed this stage
    }
    
    // Write result for this block back to global memory
    if (tid == 0)
    {
        d_out[blockIdx.x] = sdata[0];
    }
}