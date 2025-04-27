#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void reduce_v0(float* in, float* out, int n) {
    int tx = threadIdx.x;
    int bx = blockIdx.x;
    int BX = blockDim.x; // same as THREAD_MAX
    int i = bx * BX + tx;

    __shared__ float S[THEAD_MAX];

    // Allocate input to shared memory or 0 if outside bounds
    S[tx] = i < n ? in[i] : 0;
    __syncthreads();

    // Perform tree-based reduction
    for (int s = BX / 2; s > 0; s >>= 1) {
        if (tx < s) {
            S[tx] += S[tx + s];
        }
        __syncthreads();
    }

    // First thread in block writes result to output
    if (tx == 0)
        out[bx] = S[0];
}