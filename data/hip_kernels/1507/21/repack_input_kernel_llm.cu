#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void repack_input_kernel(float *input, float *re_packed_input, int w, int h, int c)
{
    int index = blockIdx.x * blockDim.x + threadIdx.x;

    if (index >= w * h * c) return; // Early exit for out-of-bounds threads

    const int items_per_channel = w * h;

    int c_pack = index % 32; // Compute the pack index
    int chan_index = index / 32;
    int chan = (chan_index * 32) % c; // Calculate original channel
    int i = (chan_index * 32) / c; // Linear index within the channel

    if (i < items_per_channel) {
        float src = input[(chan + c_pack) * items_per_channel + i];
        re_packed_input[chan * items_per_channel + i * 32 + c_pack] = src;
    }
}