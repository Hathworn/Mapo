#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void global_reduce_kernel(float * d_out, float * d_in)
{
    extern __shared__ float s_data[]; // Allocate shared memory dynamically

    int myId = threadIdx.x + blockDim.x * blockIdx.x;
    int tid = threadIdx.x;

    // Move data from global memory to shared memory
    s_data[tid] = d_in[myId];
    __syncthreads(); // Ensure all threads have loaded their data

    // Perform reduction in shared memory
    for (unsigned int s = blockDim.x / 2; s > 0; s >>= 1)
    {
        if (tid < s)
        {
            s_data[tid] += s_data[tid + s]; // Reduce using shared memory
        }
        __syncthreads(); // Synchronize for next stage
    }

    // Only thread 0 writes the result for this block back to global memory
    if (tid == 0)
    {
        d_out[blockIdx.x] = s_data[0];
    }
}