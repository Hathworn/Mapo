#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void reduce(int *a, int *b, int n) {
    __shared__ int sdata[1024]; // Allocate shared memory
    unsigned int tid = threadIdx.x;
    unsigned int i = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Load elements into shared memory
    sdata[tid] = (i < n) ? a[i] : 0;
    __syncthreads();

    // Perform reduction in shared memory
    for (unsigned int s = blockDim.x / 2; s > 0; s >>= 1) {
        if (tid < s) {
            sdata[tid] += sdata[tid + s];
        }
        __syncthreads();
    }

    // Write result back to global memory
    if (tid == 0) {
        atomicAdd(b, sdata[0]);
    }
}