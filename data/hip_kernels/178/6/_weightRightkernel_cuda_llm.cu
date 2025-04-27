```c
#include "hip/hip_runtime.h"
#include "includes.h"

#define blockx 16
#define blocky 16

__global__ void _weightRightkernel_cuda(int num_slices, int num_grid, float beta, float *dev_F, float *dev_G, float *dev_wg5, float *dev_recon)
{
    uint k = blockIdx.x * blockDim.x + threadIdx.x;
    uint n = blockIdx.y * blockDim.y + threadIdx.y + 1;
    
    // Early exit for out of bounds
    if (k >= num_slices || n >= (num_grid - 1)) return;

    int ind0 = (num_grid - 1) + n * num_grid + k * num_grid * num_grid;
    int indg[5];
    indg[0] = ind0 - 1;
    indg[1] = ind0 + num_grid;
    indg[2] = ind0 - num_grid;
    indg[3] = ind0 + num_grid - 1;
    indg[4] = ind0 - num_grid - 1;

    float beta_wg5[5];
    #pragma unroll // Unroll loop for performance
    for (int i = 0; i < 5; i++) {
        beta_wg5[i] = 2 * beta * dev_wg5[i];
    }

    float recon_sum = dev_recon[ind0]; // Cache
    #pragma unroll // Unroll loop for performance
    for (int q = 0; q < 5; q++) {
        dev_F[ind0] += beta_wg5[q];
        dev_G[ind0] -= beta_wg5[q] * (recon_sum + dev_recon[indg[q]]);
    }
}