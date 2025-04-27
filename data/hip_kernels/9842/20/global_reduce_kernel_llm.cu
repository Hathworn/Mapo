#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void global_reduce_kernel(float * d_out, float * d_in)
{
    extern __shared__ float sdata[]; // Use shared memory
    int myId = threadIdx.x + blockDim.x * blockIdx.x;
    int tid  = threadIdx.x;

    // Load data into shared memory
    sdata[tid] = d_in[myId];
    __syncthreads();

    // Do reduction in shared mem
    for (unsigned int s = blockDim.x / 2; s > 0; s >>= 1)
    {
        if (tid < s)
        {
            sdata[tid] += sdata[tid + s]; // Perform reduction
        }
        __syncthreads(); // Ensure all adds at one stage are done
    }

    // Only thread 0 writes result for this block back to global mem
    if (tid == 0)
    {
        d_out[blockIdx.x] = sdata[0];
    }
}