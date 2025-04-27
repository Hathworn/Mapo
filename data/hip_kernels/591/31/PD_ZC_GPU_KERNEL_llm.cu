```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void PD_ZC_GPU_KERNEL(float *d_input, float *d_output, int maxTaps, int nTimesamples, int nLoops)
{
    int Elements_per_block = PD_NTHREADS * PD_NWINDOWS;
    int y_r = (blockIdx.y * blockDim.y + threadIdx.y) * nTimesamples;
    int x_r_base = (blockIdx.x + 1) * Elements_per_block;
    int y_w = (blockIdx.y * blockDim.y + threadIdx.y) * (maxTaps - 1) * gridDim.x;
    int x_w_base = blockIdx.x * (maxTaps - 1);

    for (int f = 0; f < nLoops; f++)
    {
        int x_r = x_r_base + threadIdx.x; // Moving x_r calculation inside the loop to avoid redundant computation.
        int x_w = x_w_base + threadIdx.x; // Simplified access pattern by calculating inside the loop once.

        if (x_r < nTimesamples && threadIdx.x < (maxTaps - 1))
        {
            // Coalesced global memory access
            d_output[x_w + y_w + f * WARP] = d_input[x_r + y_r + f * WARP];
        }
    }
}
```
