#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void repack_input_kernel(float *input, float *re_packed_input, int w, int h, int c)
{
    // Calculate global thread index
    int index = blockIdx.x * blockDim.x + threadIdx.x;

    const int items_per_channel = w * h;
    
    // Derive channel and item indices
    int c_pack = index % 32;
    int chan_index = index / 32;
    int chan = chan_index % (c / 32) * 32;
    int i = chan_index / (c / 32);
    
    if (chan < c && i < items_per_channel)
    {
        // Optimize memory access pattern
        float src = input[(chan + c_pack) * items_per_channel + i];
        re_packed_input[chan * items_per_channel + i * 32 + c_pack] = src;
    }
}