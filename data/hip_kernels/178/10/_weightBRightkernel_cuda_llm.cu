#include "hip/hip_runtime.h"
#include "includes.h"

#define blockx 16
#define blocky 16

__global__ void _weightBRightkernel_cuda(int num_slices, int num_grid, float beta, float *dev_F, float *dev_G, float* dev_wg3, float *dev_recon)
{
    int k = blockIdx.x * blockDim.x + threadIdx.x;
    if (k >= num_slices)
        return;

    // Precompute indices and steps to improve memory access patterns
    int grid_square = num_grid * num_grid;
    int ind0 = (num_grid - 1) + (num_grid - 1) * num_grid + k * grid_square;
    int indg[3] = { ind0 - 1, ind0 - num_grid, ind0 - num_grid - 1 };
    
    float beta_wg0 = 2 * beta * dev_wg3[0];
    float beta_wg1 = 2 * beta * dev_wg3[1];
    float beta_wg2 = 2 * beta * dev_wg3[2];
    float recon_val0 = dev_recon[ind0];
    
    dev_F[ind0] += beta_wg0 + beta_wg1 + beta_wg2;
    
    // Unrolling loop for efficiency
    dev_G[ind0] -= beta_wg0 * (recon_val0 + dev_recon[indg[0]]);
    dev_G[ind0] -= beta_wg1 * (recon_val0 + dev_recon[indg[1]]);
    dev_G[ind0] -= beta_wg2 * (recon_val0 + dev_recon[indg[2]]);
}