#include "hip/hip_runtime.h"
#include "includes.h"

#define blockx 16
#define blocky 16

__global__ void _weightBottomkernel_cuda(int num_slices, int num_grid, float beta, float *dev_F, float *dev_G, float* dev_wg5, float *dev_recon)
{
    int k = blockIdx.x * blockDim.x + threadIdx.x;
    int n = blockIdx.y * blockDim.y + threadIdx.y + 1;

    if ((k >= num_slices) || (n < 1) || (n >= (num_grid - 1)))
        return;

    // Pre-calculate the common indices
    int num_grid_sq = num_grid * num_grid;
    int ind0 = n + (num_grid - 1) * num_grid + k * num_grid_sq;

    int indg[5];
    indg[0] = ind0 + 1;
    indg[1] = ind0 - 1;
    indg[2] = ind0 - num_grid;
    indg[3] = ind0 - num_grid + 1;
    indg[4] = ind0 - num_grid - 1;

    // Utilize shared memory to optimize access
    float wg5_shared[5];
    #pragma unroll
    for (int q = 0; q < 5; q++) {
        wg5_shared[q] = 2 * beta * dev_wg5[q];
    }

    // Combine updates into a single loop
    float f_update = 0.0f;
    float g_update = 0.0f;
    #pragma unroll
    for (int q = 0; q < 5; q++) {
        f_update += wg5_shared[q];
        g_update -= wg5_shared[q] * (dev_recon[ind0] + dev_recon[indg[q]]);
    }
    
    // Update global memory at once
    dev_F[ind0] += f_update;
    dev_G[ind0] += g_update;
}