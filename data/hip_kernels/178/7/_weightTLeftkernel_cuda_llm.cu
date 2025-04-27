#include "hip/hip_runtime.h"
#include "includes.h"

#define blockx 16
#define blocky 16

__global__ void _weightTLeftkernel_cuda(int num_slices, int num_grid, float beta, float *dev_F, float *dev_G, float *dev_wg3, float *dev_recon)
{
    int k = blockIdx.x * blockDim.x + threadIdx.x;
    
    if (k >= num_slices) return;

    int ind0 = k * num_grid * num_grid;
    int indg[3] = {ind0 + 1, ind0 + num_grid, ind0 + num_grid + 1};

    float shared_wg3[3];
    #pragma unroll  // Unroll the loop for performance
    for (int q = 0; q < 3; ++q) {
        shared_wg3[q] = dev_wg3[q];
        dev_F[ind0] += 2 * beta * shared_wg3[q];
        dev_G[ind0] -= 2 * beta * shared_wg3[q] * (dev_recon[ind0] + dev_recon[indg[q]]);
    }
}