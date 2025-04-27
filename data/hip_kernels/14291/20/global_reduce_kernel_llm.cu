#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void global_reduce_kernel(float * d_out, float * d_in)
{
    extern __shared__ float shared_data[]; // Use shared memory
    int myId = threadIdx.x + blockDim.x * blockIdx.x;
    int tid = threadIdx.x;

    // Load data into shared memory
    shared_data[tid] = d_in[myId];
    __syncthreads(); // Ensure all data is loaded

    // Perform reduction in shared memory
    for (unsigned int s = blockDim.x / 2; s > 0; s >>= 1)
    {
        if (tid < s)
        {
            shared_data[tid] += shared_data[tid + s];
        }
        __syncthreads(); // Ensure all adds at one stage are done
    }

    // Only thread 0 writes result for this block back to global memory
    if (tid == 0)
    {
        d_out[blockIdx.x] = shared_data[0];
    }
}