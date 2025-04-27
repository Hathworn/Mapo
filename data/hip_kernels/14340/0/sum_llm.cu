#include "hip/hip_runtime.h"
#include "includes.h"

#define N 8
#define NBLOCKS 4
#define NTHREADS (N/NBLOCKS)

__global__ void sum(int* in, int* out) {
    extern __shared__ int shared[];
    int tid = threadIdx.x;
    int bid = blockIdx.x;
    int bdim = blockDim.x;
    
    shared[tid] = in[bid * bdim + tid]; // Load input into shared memory
    __syncthreads();
    
    // Use a loop to perform the reduction
    for (int stride = bdim / 2; stride > 0; stride /= 2) {
        if (tid < stride) {
            shared[tid] += shared[tid + stride];
        }
        __syncthreads();
    }
    
    // Store the result in the output array
    if (tid == 0) {
        out[bid] = shared[0];
    }
}