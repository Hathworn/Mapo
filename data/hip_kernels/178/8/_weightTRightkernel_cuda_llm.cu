#include "hip/hip_runtime.h"
#include "includes.h"

/*
Copyright 2014-2015 Dake Feng, Peri LLC, dakefeng@gmail.com

This file is part of TomograPeri.

TomograPeri is free software: you can redistribute it and/or modify
it under the terms of the GNU Lesser General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

TomograPeri is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU Lesser General Public License
along with TomograPeri.  If not, see <http://www.gnu.org/licenses/>.
*/

#define blockx 16
#define blocky 16

__global__ void _weightTRightkernel_cuda(int num_slices, int num_grid, float beta, float * __restrict__ dev_F, const float * __restrict__ dev_G, const float* __restrict__ dev_wg3, const float *__restrict__ dev_recon)
{
    int k = blockIdx.x * blockDim.x + threadIdx.x;
    if (k >= num_slices)
        return;

    // Calculate initial index positions
    int ind0 = (num_grid - 1) + k * num_grid * num_grid;
    int indg[3];
    indg[0] = ind0 - 1;
    indg[1] = ind0 + num_grid;
    indg[2] = ind0 + num_grid - 1;

    float beta2 = 2.0f * beta;  // Precompute constant multiplier
    float dev_F_shared = dev_F[ind0];  // Load dev_F[ind0] once

    for (int q = 0; q < 3; q++) {
        float wg3_val = dev_wg3[q];
        dev_F_shared += beta2 * wg3_val;  // Use shared value for dev_F
        dev_G[ind0] -= beta2 * wg3_val * (dev_recon[ind0] + dev_recon[indg[q]]);
    }

    dev_F[ind0] = dev_F_shared;  // Store back the computed result
}