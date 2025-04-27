#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void MultiChannelsSplit(float* inputs, float* outputs, int outChannels, int offset, int row, int inChannels)
{
    int batchId = blockIdx.x;
    float* input = inputs + batchId * inChannels * row * row + offset;

    int blockDo  = outChannels * row * row;
    int j = blockIdx.y * blockDim.x + threadIdx.x; // Spread the work across multiple blocks

    if(j < blockDo)
    {
        int pos = batchId * outChannels * row * row;
        outputs[pos + j] = input[j];
    }
}