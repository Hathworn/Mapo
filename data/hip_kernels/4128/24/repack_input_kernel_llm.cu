#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void repack_input_kernel(float *input, float *re_packed_input, int w, int h, int c)
{
    int index = blockIdx.x * blockDim.x + threadIdx.x;
    const int items_per_channel = w * h;
    const int pack_size = 32;

    // Simplified channel index calculation
    int total_pack_size = (c + pack_size - 1) / pack_size * pack_size; // Align to pack size
    if (index >= total_pack_size * items_per_channel) return; // Boundary check

    int i = index / total_pack_size;   // Item index
    int chan_pack_offset = index % total_pack_size; // Offset within the pack
    int chan_index = chan_pack_offset / pack_size * pack_size; // Base channel index
    int c_pack = chan_pack_offset % pack_size; // c_pack within this offset section

    if (chan_index + c_pack < c) { // Valid channel check
        float src = input[(chan_index + c_pack) * items_per_channel + i];
        re_packed_input[chan_index * items_per_channel + i * pack_size + c_pack] = src;
    }
}