#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void reduce_v0(float* in, float* out, int n) {
    int tx = threadIdx.x;
    int bx = blockIdx.x;
    int BX = blockDim.x; 
    int i = bx * BX + tx;

    __shared__ float S[THEAD_MAX];

    // Initialize shared memory with input data if within bounds
    S[tx] = (i < n) ? in[i] : 0;
    __syncthreads();

    // Perform reduction in shared memory
    for (int s = BX / 2; s > 0; s >>= 1) { // Use stride halving
        if (tx < s) {
            S[tx] += S[tx + s];
        }
        __syncthreads();
    }

    // Write result for this block to global memory
    if (tx == 0) {
        out[bx] = S[0];
    }
}