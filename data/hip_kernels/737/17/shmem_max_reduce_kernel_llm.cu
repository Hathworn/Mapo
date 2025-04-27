#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void shmem_max_reduce_kernel(float * d_max, const float * d_in) {
    // Allocate shared memory
    extern __shared__ float sdata[];

    int myId = threadIdx.x + blockDim.x * blockIdx.x;
    int tid  = threadIdx.x;

    // Load shared mem from global mem
    sdata[tid] = d_in[myId];
    __syncthreads(); // Ensure entire block is loaded

    // Reduction in shared mem
    for (unsigned int s = blockDim.x / 2; s > 0; s >>= 1) {
        if (tid < s) {
            sdata[tid] = max(sdata[tid], sdata[tid + s]);
        }
        __syncthreads(); // Ensure all max operations at one stage are done
    }

    // Thread 0 writes result for this block back to global mem
    if (tid == 0) {
        d_max[blockIdx.x] = sdata[0];
    }
}