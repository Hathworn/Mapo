#include "hip/hip_runtime.h"
#include "includes.h"

#define blockx 16
#define blocky 16

__global__ void _weightTopkernel_cuda(int num_slices, int num_grid, float beta, float *dev_F, float *dev_G, float *dev_wg5, float *dev_recon)
{
    int indg[5];
    uint k = blockIdx.x * blockDim.x + threadIdx.x;
    uint n = blockIdx.y * blockDim.y + threadIdx.y + 1;

    if ((k >= num_slices) || (n < 1) || (n >= (num_grid - 1)))
        return;
    
    int ind0 = n + k * num_grid * num_grid;

    // Precompute indices to reduce redundant calculations
    indg[0] = ind0 + 1;
    indg[1] = ind0 - 1;
    indg[2] = ind0 + num_grid;
    indg[3] = ind0 + num_grid + 1;
    indg[4] = ind0 + num_grid - 1;

    // Aggregate operations to minimize memory accesses
    float F_update = 0.0f;
    float G_update = 0.0f;

    #pragma unroll // Unroll loop for performance
    for (int q = 0; q < 5; q++) {
        F_update += 2 * beta * dev_wg5[q];
        G_update -= 2 * beta * dev_wg5[q] * (dev_recon[ind0] + dev_recon[indg[q]]);
    }

    dev_F[ind0] += F_update;
    dev_G[ind0] += G_update;
}