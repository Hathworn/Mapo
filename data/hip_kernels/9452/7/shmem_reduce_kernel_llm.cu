#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void shmem_reduce_kernel(float * d_out, const float * d_in)
{
    // Shared data allocated in the kernel call: 3rd arg to <<<b, t, shmem>>>
    extern __shared__ float sdata[];

    int myId = threadIdx.x + blockDim.x * blockIdx.x;
    int tid = threadIdx.x;

    // Load shared memory from global memory
    sdata[tid] = d_in[myId];
    __syncthreads();  // Make sure entire block is loaded

    // Perform reduction in shared memory
    // Use warp-synchronous to reduce synchronization overhead
    for (unsigned int s = blockDim.x / 2; s > 0; s >>= 1)
    {
        if (tid < s)
        {
            sdata[tid] += sdata[tid + s];
        }
        __syncthreads();  // Ensure all adds at one stage are done
    }

    // Only thread 0 writes the result back to global memory for this block
    if (tid == 0)
    {
        d_out[blockIdx.x] = sdata[0];
    }
}