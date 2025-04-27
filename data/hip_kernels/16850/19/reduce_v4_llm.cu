#include "hip/hip_runtime.h"
#include "includes.h"

__device__ void warp_reduce(float* S, int tx) {
    S[tx] += S[tx + 32];
    S[tx] += S[tx + 16];
    S[tx] += S[tx + 8];
    S[tx] += S[tx + 4];
    S[tx] += S[tx + 2];
    S[tx] += S[tx + 1];
}

__global__ void reduce_v4(float* in, float* out, int n) {
    int tx = threadIdx.x;
    int bx = blockIdx.x;
    int BX = blockDim.x; // same as THREAD_MAX
    int i = bx * (BX * 2) + tx;

    __shared__ float S[THREAD_MAX];

    // Improved memory coalescing and reduced thread divergence
    S[tx] = in[i] + (i + BX < n ? in[i + BX] : 0.0f);
    __syncthreads();

    // Efficient shared memory reduction
    for (int s = BX / 2; s > WARP_SIZE; s >>= 1) {
        if (tx < s) {
            S[tx] += S[tx + s];
        }
        __syncthreads();
    }

    // Warp-level reduction
    if (tx < WARP_SIZE) {
        warp_reduce(S, tx);
    }

    // Output the result for this block
    if (tx == 0) {
        out[bx] = S[0];
    }
}