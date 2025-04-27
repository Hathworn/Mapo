#include "hip/hip_runtime.h"
#include "includes.h"

__global__ static void sum_channels(float *dest, const float *src, uint channels, uint num_channel_elem)
{
    int idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Use stride to handle more elements and reduce unoptimized loop iteration
    for (uint i = idx; i < num_channel_elem; i += blockDim.x * gridDim.x) {
        float acc = 0;
        for (uint c = 0; c < channels; ++c) {
            acc += src[i + c * num_channel_elem];
        }
        dest[i] = acc;
    }
}