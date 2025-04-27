#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void global_reduce_kernel(float *d_out, float *d_in)
{
    extern __shared__ float s_data[];

    int myId = threadIdx.x + blockDim.x * blockIdx.x;
    int tid = threadIdx.x;
    
    // Load data into shared memory for faster access
    s_data[tid] = d_in[myId];
    __syncthreads();
    
    // Perform reduction within shared memory
    for (unsigned int s = blockDim.x / 2; s > 0; s >>= 1)
    {
        if (tid < s)
        {
            s_data[tid] += s_data[tid + s];
        }
        __syncthreads(); // Ensure all additions at one stage are completed
    }

    // Only thread 0 writes result for this block back to global memory
    if (tid == 0)
    {
        d_out[blockIdx.x] = s_data[0];
    }
}