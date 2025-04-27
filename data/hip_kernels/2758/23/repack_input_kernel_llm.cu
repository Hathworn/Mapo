#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void repack_input_kernel(float *input, float *re_packed_input, int w, int h, int c)
{
    // Calculate the global index for this thread in the kernel
    int index = blockIdx.x * blockDim.x + threadIdx.x;

    // Calculate items per channel assuming w * h
    const int items_per_channel = w * h;

    // Determine the sub-index of the kernel processing within a single channel block (32 items)
    int c_pack = index % 32;
    // Compute the current processing index across channels
    int chan_index = index / 32;
    // Calculate current channel
    int chan = (chan_index * 32) % c;
    // Calculate relative position/index within items_per_channel
    int i = (chan_index * 32) / c;

    // Proceed only if within boundary limits
    if (i < items_per_channel)
    {
        // Read source and write to destination in a coalesced memory access pattern
        float src = input[(chan + c_pack) * items_per_channel + i];
        re_packed_input[chan * items_per_channel + i * 32 + c_pack] = src;
    }
}