#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void repack_input_kernel_2(float *input, float *re_packed_input, int w, int h, int c)
{
    // Calculate index for parallel work across threads
    int index = blockIdx.x * blockDim.x + threadIdx.x;

    const int items_per_channel = w * h;

    // Precompute values for efficient access
    int c_pack = index % 32;
    int chan_index = index / 32;
    int chan = (chan_index * 32) % c;
    int i = (chan_index * 32) / c;

    // Check bounds to avoid out of range access
    if (i < items_per_channel && chan + c_pack < c) 
    {
        // Accessing input and repacking without looping
        float src = input[(chan + c_pack) * items_per_channel + i];
        re_packed_input[chan * items_per_channel + i * 32 + c_pack] = src;
    }
}