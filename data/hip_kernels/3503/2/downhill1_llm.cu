#include "hip/hip_runtime.h"
#include "includes.h"
/*
Copyright [2019] [illava(illava@outlook.com)]

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
*/

const int blockSize = 1024;

// Optimized kernel
__global__ void downhill1(uint32_t *d_value, uint8_t *d_key, uint8_t *d_temp, int64_t n, int64_t shift)
{
    int64_t idx = blockIdx.x * blockDim.x + threadIdx.x;
    if (idx + shift < n && idx % (2 * shift) == 0) // Combine outer conditions
    {
        int64_t target_idx = n - 1 - idx;
        int64_t target_shift_idx = n - 1 - (idx + shift);
        
        uint32_t tmp = d_value[target_shift_idx];
        d_value[target_shift_idx] = d_value[target_idx];

        if (d_key[target_shift_idx - 1] == 1) // Simplified index calculation
        {
            d_value[target_idx] = 0;
        }
        else
        {
            d_value[target_idx] = (d_temp[target_shift_idx] == 1) ? tmp : (tmp + d_value[target_idx]);
        }

        d_temp[target_shift_idx] = 0; // Direct write, avoids recalculating index
    }
}