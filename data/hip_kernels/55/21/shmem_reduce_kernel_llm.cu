#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void shmem_reduce_kernel(float *d_out, const float *d_in) {
    // Shared memory allocated dynamically
    extern __shared__ float sdata[];

    int tid = threadIdx.x;
    int myId = tid + blockDim.x * blockIdx.x;

    // Load data into shared memory
    sdata[tid] = d_in[myId];
    __syncthreads(); // Ensure all data is loaded

    // Perform reduction using shared memory
    for (unsigned int s = blockDim.x / 2; s > 0; s >>= 1) {
        if (tid < s) {
            // Reduction step
            sdata[tid] += sdata[tid + s];
        }
        __syncthreads(); // Synchronize threads at each step
    }

    // Write the result to global memory from thread 0
    if (tid == 0) {
        d_out[blockIdx.x] = sdata[0];
    }
}