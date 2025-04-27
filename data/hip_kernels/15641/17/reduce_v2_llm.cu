#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void reduce_v2(float* in, float* out, int n) {
    int tx = threadIdx.x;
    int bx = blockIdx.x;
    int BX = blockDim.x; // same as THEAD_MAX
    int i  = bx * BX + tx;

    extern __shared__ float S[]; // Use dynamic shared memory

    S[tx] = (i < n) ? in[i] : 0;
    __syncthreads();

    // Use a loop unrolling technique for optimization
    for (int s = BX / 2; s > 32; s >>= 1) {
        if (tx < s) {
            S[tx] += S[tx + s];
        }
        __syncthreads();
    }

    if (tx < 32) {
        volatile float* Smem = S; // Using volatile to ensure no optimization issues
        Smem[tx] += Smem[tx + 32];
        Smem[tx] += Smem[tx + 16];
        Smem[tx] += Smem[tx + 8];
        Smem[tx] += Smem[tx + 4];
        Smem[tx] += Smem[tx + 2];
        Smem[tx] += Smem[tx + 1];
    }

    if (tx == 0) {
        out[bx] = S[0];
    }
}