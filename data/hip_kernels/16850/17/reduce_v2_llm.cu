```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void reduce_v2(float* in, float* out, int n) {
    int tx = threadIdx.x;
    int bx = blockIdx.x;
    int BX = blockDim.x;
    int i = bx * BX + tx;

    __shared__ float S[THEAD_MAX];

    S[tx] = (i < n) ? in[i] : 0;
    __syncthreads();

    // Use loop unrolling for optimization
    for (int s = BX / 2; s > 32; s >>= 1) {
        if (tx < s) {
            S[tx] += S[tx + s];
        }
        __syncthreads();
    }

    // Unrolling last warp
    if (tx < 32) {
        volatile float* vS = S;
        vS[tx] += vS[tx + 32];
        vS[tx] += vS[tx + 16];
        vS[tx] += vS[tx + 8];
        vS[tx] += vS[tx + 4];
        vS[tx] += vS[tx + 2];
        vS[tx] += vS[tx + 1];
    }

    if (tx == 0) {
        out[bx] = S[0];
    }
}