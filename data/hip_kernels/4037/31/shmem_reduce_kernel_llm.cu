#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void shmem_reduce_kernel(float *d_out, const float *d_in) {
    extern __shared__ float sdata[];

    // Calculate thread and block IDs
    int myId = threadIdx.x + blockDim.x * blockIdx.x;
    int tid = threadIdx.x;

    // Load data into shared memory
    sdata[tid] = d_in[myId];
    __syncthreads();

    // Perform reduction using shared memory
    for (unsigned int s = blockDim.x / 2; s > 0; s >>= 1) {
        // Make sure the threads accessing data are active
        if (tid < s) {
            // Use atomic operation to prevent race conditions
            atomicAdd(&sdata[tid], sdata[tid + s]);
        }
        __syncthreads(); 
    }

    // Write result from shared memory to global memory
    if (tid == 0) {
        d_out[blockIdx.x] = sdata[0];
    }
}