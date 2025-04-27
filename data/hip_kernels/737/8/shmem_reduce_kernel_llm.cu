#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void shmem_reduce_kernel(float * d_out, const float * d_in)
{
    // Shared memory allocation
    extern __shared__ float sdata[];

    int myId = threadIdx.x + blockDim.x * blockIdx.x;
    int tid  = threadIdx.x;

    // Load shared mem from global mem with boundary check
    if (myId < gridDim.x * blockDim.x) {
        sdata[tid] = d_in[myId];
    } else {
        sdata[tid] = 0.0f;  // Handle out of bounds
    }
    __syncthreads();  // Ensure entire block is loaded

    // Do reduction in shared mem
    for (unsigned int s = blockDim.x / 2; s > 0; s >>= 1)
    {
        if (tid < s && myId + s < gridDim.x * blockDim.x) {  // Boundary condition
            sdata[tid] += sdata[tid + s];
        }
        __syncthreads();  // Ensure all adds at one stage are done
    }

    // Only thread 0 writes result for this block back to global mem
    if (tid == 0)
    {
        d_out[blockIdx.x] = sdata[0];
    }
}