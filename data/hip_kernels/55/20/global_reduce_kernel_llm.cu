#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void global_reduce_kernel(float * d_out, float * d_in)
{
    extern __shared__ float shared[]; // Allocate shared memory
    int myId = threadIdx.x + blockDim.x * blockIdx.x;
    int tid = threadIdx.x;

    // Load input into shared memory
    shared[tid] = d_in[myId];
    __syncthreads();

    // Perform reduction in shared memory
    for (unsigned int s = blockDim.x / 2; s > 0; s >>= 1)
    {
        if (tid < s)
        {
            shared[tid] += shared[tid + s];
        }
        __syncthreads(); // Ensure all operations at this step are done
    }

    // Only thread 0 writes result for this block back to global mem
    if (tid == 0)
    {
        d_out[blockIdx.x] = shared[0];
    }
}