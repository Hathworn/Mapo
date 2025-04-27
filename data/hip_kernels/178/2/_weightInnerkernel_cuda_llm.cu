#include "hip/hip_runtime.h"
#include "includes.h"

#define blockx 16
#define blocky 16

__global__ void _weightInnerkernel_cuda(int num_slices, int num_grid, float beta, float *dev_F, float *dev_G, float *dev_wg8, float *dev_recon)
{
    uint m = blockIdx.x * blockDim.x + threadIdx.x + 1;
    uint n = blockIdx.y * blockDim.y + threadIdx.y + 1;
    uint k = blockIdx.z;

    if ((k >= num_slices) || (n < 1) || (n >= (num_grid - 1)) || (m < 1) || (m >= (num_grid - 1)))
        return;

    int ind0 = m + n * num_grid + k * num_grid * num_grid;
    int indg[8];

    // Pre-calculate indices to avoid repeated computation in the loop
    indg[0] = ind0 + 1;
    indg[1] = ind0 - 1;
    indg[2] = ind0 + num_grid;
    indg[3] = ind0 - num_grid;
    indg[4] = ind0 + num_grid + 1;
    indg[5] = ind0 + num_grid - 1;
    indg[6] = ind0 - num_grid + 1;
    indg[7] = ind0 - num_grid - 1;

    // Use temporary variables to minimize repeated memory access
    float tempF = dev_F[ind0];
    float tempG = dev_G[ind0];
    float reconInd0 = dev_recon[ind0];

    for (int q = 0; q < 8; q++) {
        float wg8_q = dev_wg8[q];
        float term = 2 * beta * wg8_q;
        float reconSum = reconInd0 + dev_recon[indg[q]];

        tempF += term;
        tempG -= term * reconSum;
    }

    // Write back to global memory
    dev_F[ind0] = tempF;
    dev_G[ind0] = tempG;
}