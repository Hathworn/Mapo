#include "hip/hip_runtime.h"
#include "includes.h"

__device__ void warp_reduce(float* S, int tx) {
    // Efficient warp-level reduction with loop unrolling
    if (tx < 32) {
        S[tx] += S[tx + 32];
        S[tx] += S[tx + 16];
        S[tx] += S[tx + 8];
        S[tx] += S[tx + 4];
        S[tx] += S[tx + 2];
        S[tx] += S[tx + 1];
    }
}

__global__ void reduce_v5(float* in, float* out, int n) {
    int tx = threadIdx.x;
    int bx = blockIdx.x;
    int i = bx * (BX * 2) + tx;

    __shared__ float S[BX]; 

    // Coalesced reads and reduce per block
    S[tx] = in[i] + in[i + BX];
    __syncthreads();

    // Use dynamic parallelism based on block size
    if (BX >= 1024) {
        if (tx < 512) S[tx] += S[tx + 512];
        __syncthreads();
    }

    if (BX >= 512) {
        if (tx < 256) S[tx] += S[tx + 256];
        __syncthreads();
    }

    if (BX >= 256) {
        if (tx < 128) S[tx] += S[tx + 128];
        __syncthreads();
    }

    if (BX >= 128) {
        if (tx < 64) S[tx] += S[tx + 64];
        __syncthreads();
    }

    if (tx < 32) {
        // Perform warp-level reduction
        warp_reduce(S, tx);
    }

    // Write block result to global memory
    if (tx == 0) out[bx] = S[0];
}