#include "hip/hip_runtime.h"
#include "includes.h"

__inline__ __device__ void warp_reduce(float* S, int tx) {
    // Perform warp reduction without __syncthreads() for faster execution
    S[tx] += S[tx + 32];
    S[tx] += S[tx + 16];
    S[tx] += S[tx + 8];
    S[tx] += S[tx + 4];
    S[tx] += S[tx + 2];
    S[tx] += S[tx + 1];
}

__global__ void reduce_v5(float* in, float* out, int n) {
    int tx = threadIdx.x;
    int bx = blockIdx.x;
    int i = bx * (BX * 2) + tx;

    __shared__ float S[BX];

    // Improved coalesced access for higher memory throughput
    if (i < n) S[tx] = in[i] + ((i + BX) < n ? in[i + BX] : 0.0f);
    else S[tx] = 0.0f;
    __syncthreads();

    if (BX >= 1024) { if (tx < 512) S[tx] += S[tx + 512]; __syncthreads(); }
    if (BX >= 512) { if (tx < 256) S[tx] += S[tx + 256]; __syncthreads(); }
    if (BX >= 256) { if (tx < 128) S[tx] += S[tx + 128]; __syncthreads(); }
    if (BX >= 128) { if (tx < 64) S[tx] += S[tx + 64]; __syncthreads(); }

    if (tx < WARP_SIZE) warp_reduce(S, tx);

    if (tx == 0) out[bx] = S[0];
}