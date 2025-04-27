#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void shmem_reduce_kernel(float * d_out, const float * d_in) {
    // sdata is allocated in the kernel call: 3rd arg to <<<b, t, shmem>>>
    extern __shared__ float sdata[];

    int myId = threadIdx.x + blockDim.x * blockIdx.x;
    int tid  = threadIdx.x;

    // Load shared mem from global mem
    sdata[tid] = d_in[myId];
    __syncthreads();  // Ensure entire block is loaded

    // Perform reduction in shared mem
    for (unsigned int s = blockDim.x / 2; s > 0; s >>= 1) {
        // Unrolling the last warp for better performance
        if (tid < s) {
            sdata[tid] += sdata[tid + s];
        }
        __syncthreads();  // Ensure all adds at one stage are done
    }

    // Only thread 0 writes result for this block back to global mem
    if (tid == 0) {
        d_out[blockIdx.x] = sdata[0];
    }
}