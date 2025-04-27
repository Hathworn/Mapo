#include "hip/hip_runtime.h"
#include "includes.h"

#define blockx 16
#define blocky 16

__global__ void _weightLeftkernel_cuda(int num_slices, int num_grid, float beta, float *dev_F, float *dev_G, float* dev_wg5, float *dev_recon)
{
    // Calculate thread indices
    uint k = blockIdx.x * blockDim.x + threadIdx.x;
    uint n = blockIdx.y * blockDim.y + threadIdx.y + 1;

    // Boundary check
    if ((k >= num_slices) || (n < 1) || (n >= (num_grid - 1)))
        return;

    int ind0 = n * num_grid + k * num_grid * num_grid;

    // Compute indg indices
    int indg[5];
    indg[0] = ind0 + 1;
    indg[1] = ind0 + num_grid;
    indg[2] = ind0 - num_grid;
    indg[3] = ind0 + num_grid + 1;
    indg[4] = ind0 - num_grid + 1;

    // Loop unrolling for optimization
    #pragma unroll
    for (int q = 0; q < 5; q++) {
        float wg5q = 2 * beta * dev_wg5[q];
        dev_F[ind0] += wg5q;
        dev_G[ind0] -= wg5q * (dev_recon[ind0] + dev_recon[indg[q]]);
    }
}