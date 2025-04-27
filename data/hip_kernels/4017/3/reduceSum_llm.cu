#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized reduceSum kernel
__global__ void reduceSum(double* d_arr, const size_t sz, double* d_out) {
    extern __shared__ double sh_out[];
    int myId = threadIdx.x + blockDim.x * blockIdx.x;
    int tId = threadIdx.x;

    // Initialize shared memory to zero for out-of-bounds threads
    sh_out[tId] = (myId < sz) ? d_arr[myId] : 0.0;
    __syncthreads();

    // Reduce the shared memory using a binary tree reduction
    for (unsigned int s = blockDim.x / 2; s > 0; s >>= 1) {
        if (tId < s) {
            sh_out[tId] += sh_out[tId + s];
        }
        __syncthreads();
    }

    // Write result from the first thread
    if (tId == 0) {
        d_out[blockIdx.x] = sh_out[0];
    }
}