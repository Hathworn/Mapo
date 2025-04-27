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

__global__ void _sGkernel_cuda(int num_slices, int num_grid, float* dev_G, float *dev_suma)
{
    // Using threadIdx and blockIdx directly reduces register usage
    uint m = threadIdx.x + blockIdx.x * blockDim.x;
    uint n = threadIdx.y + blockIdx.y * blockDim.y;
    uint k = blockIdx.z;
    
    // Check bounds to avoid out of range memory access
    if (m < num_grid && n < num_grid && k < num_slices) 
    {
        uint i = m + n * num_grid + k * num_grid * num_grid;
        uint j = m + n * num_grid;
        dev_G[i] += dev_suma[j];
    }
}