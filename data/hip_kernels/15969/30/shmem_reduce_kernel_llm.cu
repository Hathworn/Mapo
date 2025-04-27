#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void shmem_reduce_kernel(float * d_out, const float * d_in) {
    extern __shared__ float sdata[];
    int myId = threadIdx.x + blockDim.x * blockIdx.x;
    int tid = threadIdx.x;

    // Load input into shared memory
    if (myId < gridDim.x * blockDim.x) {
        sdata[tid] = d_in[myId];
    } else {
        sdata[tid] = 0.0f; // Handle out-of-bound threads
    }
    __syncthreads(); 

    // Perform reduction in shared memory
    for (unsigned int s = blockDim.x / 2; s > 0; s >>= 1) {
        if (tid < s && myId + s < gridDim.x * blockDim.x) { // Bound checking
            sdata[tid] += sdata[tid + s];
        }
        __syncthreads(); 
    }

    // Write result from the first thread of the block
    if (tid == 0) {
        d_out[blockIdx.x] = sdata[0];
    }
}