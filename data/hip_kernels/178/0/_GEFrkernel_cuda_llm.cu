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

__global__ void _GEFrkernel_cuda(int num_slices, int num_grid, float* dev_recon, float* dev_G, float* dev_E, float* dev_F)
{
    uint m = blockIdx.x * blockDim.x + threadIdx.x;
    uint n = blockIdx.y * blockDim.y + threadIdx.y;
    uint k = blockIdx.z;

    // Improved index calculation using shared memory
    extern __shared__ float shared[];
    unsigned int grid_size = num_grid * num_grid * num_slices;
    if (m < num_grid && n < num_grid && k < num_slices) {
        uint i = m + n * num_grid + k * num_grid * num_grid;

        // Use shared memory to optimize memory access
        shared[threadIdx.x + threadIdx.y * blockDim.x] = dev_G[i];
        __syncthreads();

        float G_val = shared[threadIdx.x + threadIdx.y * blockDim.x];
        float E_val = dev_E[i];
        float F_val = dev_F[i];
        
        dev_recon[i] = (-G_val + sqrtf(G_val * G_val - 8.0f * E_val * F_val)) / (4.0f * F_val);
    }
}