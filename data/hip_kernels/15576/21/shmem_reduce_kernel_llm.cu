#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void shmem_reduce_kernel(float * d_out, const float * d_in)
{
    // Shared memory for the reduction
    extern __shared__ float sdata[];

    unsigned int myId = threadIdx.x + blockDim.x * blockIdx.x;
    unsigned int tid = threadIdx.x;

    // Load shared mem from global mem
    if (myId < gridDim.x * blockDim.x) { // Avoid out-of-bounds access
        sdata[tid] = d_in[myId];
    } else {
        sdata[tid] = 0; // Pad with zero to handle non-power-of-two blocks
    }
    __syncthreads(); // Ensure all threads have loaded data

    // Do reduction in shared mem
    for (unsigned int s = blockDim.x / 2; s > 0; s >>= 1) {
        if (tid < s) {
            sdata[tid] += sdata[tid + s];
        }
        __syncthreads(); // Ensure all adds at one stage are done
    }

    // Only thread 0 writes result for this block back to global mem
    if (tid == 0) {
        d_out[blockIdx.x] = sdata[0];
    }
}