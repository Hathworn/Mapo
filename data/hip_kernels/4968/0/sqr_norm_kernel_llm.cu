#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void sqr_norm_kernel(const float *in, float *block_res, int total)
{
    extern __shared__ float sdata[];
    int in_idx = 2 * (blockIdx.x * blockDim.x + threadIdx.x);
    int i = threadIdx.x;
    unsigned ins = blockDim.x;

    // Initialize shared memory with input values squared
    sdata[i] = (in_idx < total * 2) ? (in[in_idx] * in[in_idx] + in[in_idx + 1] * in[in_idx + 1]) : 0;

    // Perform reduction using shared memory
    __syncthreads();
    for (unsigned stride = ins / 2; stride > 0; stride >>= 1) {
        if (i < stride && i + stride < ins) {
            sdata[i] += sdata[i + stride];
        }
        __syncthreads();
    }

    // Store the result in block_res
    if (i == 0) {
        block_res[blockIdx.x] = sdata[0];
    }
}