#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void sqr_norm_kernel(const float *in, float *block_res, int total)
{
    extern __shared__ float sdata[];
    int in_idx = 2 * (blockIdx.x * blockDim.x + threadIdx.x);
    int i = threadIdx.x;
    unsigned ins = blockDim.x;

    // Load into shared memory
    sdata[i] = (in_idx < total * 2) ? (in[in_idx] * in[in_idx] + in[in_idx + 1] * in[in_idx + 1]) : 0;
    __syncthreads();

    // In-place reduction using shared memory
    for (unsigned outs = (ins + 1) / 2; ins > 1; ins = outs, outs = (outs + 1) / 2) {
        if (i + outs < ins)
            sdata[i] += sdata[i + outs];
        __syncthreads();
    }

    // Write result for this block to global memory
    if (i == 0)
        block_res[blockIdx.x] = sdata[0];
}