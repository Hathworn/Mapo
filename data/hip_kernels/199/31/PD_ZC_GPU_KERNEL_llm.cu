#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void PD_ZC_GPU_KERNEL(float *d_input, float *d_output, int maxTaps, int nTimesamples, int nLoops)
{
    int x_r, y_r, x_w, y_w;
    int Elements_per_block = PD_NTHREADS * PD_NWINDOWS;

    y_r = (blockIdx.y * blockDim.y + threadIdx.y) * nTimesamples;
    x_r = (blockIdx.x + 1) * Elements_per_block + threadIdx.x;

    y_w = (blockIdx.y * blockDim.y + threadIdx.y) * (maxTaps - 1) * gridDim.x;
    x_w = blockIdx.x * (maxTaps - 1) + threadIdx.x;

    // Unrolling the loop for better performance
    #pragma unroll
    for (int f = 0; f < nLoops; f++)
    {
        if (x_r < nTimesamples && threadIdx.x < (maxTaps - 1))
        {
            // Removing loop-dependent variables calculation from loop
            int output_idx = x_w + y_w + f * WARP;
            int input_idx = x_r + y_r + f * WARP;
            d_output[output_idx] = d_input[input_idx];
        }
    }
}