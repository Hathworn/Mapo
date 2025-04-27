#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void sqr_norm_kernel(const float *in, float *block_res, int total)
{
    extern __shared__ float sdata[];
    int in_idx = 2 * (blockIdx.x * blockDim.x + threadIdx.x);
    int i = threadIdx.x;
    unsigned ins = blockDim.x;

    // Improved boundary check with conditional operator
    sdata[i] = (in_idx < total * 2) ? (in[in_idx] * in[in_idx] + in[in_idx + 1] * in[in_idx + 1]) : 0;

    // Optimized loop with power-of-two assumption for block size
    for (unsigned stride = ins / 2; stride > 0; stride /= 2) {
        __syncthreads();
        if (i < stride)
            sdata[i] += sdata[i + stride];
    }

    // Store result from the block
    if (i == 0)
        block_res[blockIdx.x] = sdata[0];
}