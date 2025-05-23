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

// Optimized kernel function
__global__ void uphill1(uint32_t *d_value, uint8_t *d_key, uint8_t *d_temp, int64_t n, int64_t shift)
{
    int64_t idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure idx is within bounds and meets condition simultaneously
    int64_t target_idx = n - 1 - idx;
    int64_t target_shifted_idx = target_idx - shift;

    if (idx % (2 * shift) == 0 && target_shifted_idx >= 0)
    {
        if (d_temp[target_idx] == 0)
            d_value[target_idx] += d_value[target_shifted_idx];
        d_temp[target_idx] |= d_temp[target_shifted_idx];
    }
}