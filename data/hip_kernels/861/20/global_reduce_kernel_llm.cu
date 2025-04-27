#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void global_reduce_kernel(float * d_out, float * d_in)
{
    __shared__ float sharedData[1024]; // Use shared memory for reduction
    int myId = threadIdx.x + blockDim.x * blockIdx.x;
    int tid  = threadIdx.x;

    // Load data into shared memory and synchronize
    sharedData[tid] = d_in[myId];
    __syncthreads();

    // Perform reduction in shared memory
    for (unsigned int s = blockDim.x / 2; s > 0; s >>= 1)
    {
        if (tid < s)
        {
            sharedData[tid] += sharedData[tid + s];
        }
        __syncthreads(); // Make sure all adds at one stage are done
    }

    // Only thread 0 writes result for this block back to global memory
    if (tid == 0)
    {
        d_out[blockIdx.x] = sharedData[0];
    }
}