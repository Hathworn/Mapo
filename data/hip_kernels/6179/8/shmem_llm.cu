#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void shmem(int *in, int *out, int N) {
    extern __shared__ int buf[];

    int idx = blockDim.x * blockIdx.x + threadIdx.x;
    int tid = threadIdx.x; // Local index within the block

    // Load input into shared memory
    if (idx < N) {
        buf[tid] = in[idx];
    }
    __syncthreads();

    // Perform in-place reversal using shared memory
    if (tid < blockDim.x / 2) {
        int mirrorIdx = blockDim.x - tid - 1;
        if (idx + mirrorIdx < N) { // Ensure within bounds
            int tmp = buf[mirrorIdx];
            buf[mirrorIdx] = buf[tid];
            buf[tid] = tmp;
        }
    }
    __syncthreads();

    // Write result back to global memory
    if (idx < N) {
        out[idx] = buf[tid];
    }
}