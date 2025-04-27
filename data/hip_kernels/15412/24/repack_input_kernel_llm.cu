```c
#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void repack_input_kernel(float *input, float *re_packed_input, int w, int h, int c)
{
    int index = blockIdx.x * blockDim.x + threadIdx.x;
    const int items_per_channel = w * h;

    // Precompute loop-invariant indices outside the loop
    int total_items = items_per_channel * c;
    int c_pack = index % 32;
    int chan_index = index / 32;
    int chan = (chan_index * 32) % c;
    int i = (chan_index * 32) / c;

    // Combined the loops into one; Conditional check to ensure valid index
    if (index < total_items)
    {
        float src = input[(chan + c_pack) * items_per_channel + i];
        re_packed_input[chan * items_per_channel + i * 32 + c_pack] = src;
    }
}