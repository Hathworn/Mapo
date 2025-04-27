#include "hip/hip_runtime.h"
#include "includes.h"

// HBYTE, MBYTE, LBYTE indices are assumed to be pre-defined or replaced with actual values
__global__ void gpu_copyPredictorTo20(int32_t * in, uint8_t * out, uint32_t stride, uint32_t * numSamples, int32_t theOutputPacketBytes, uint32_t frameLength)
{
    int block = blockIdx.x % 8;
    int index = blockIdx.x / 8;
    int z = threadIdx.x + block * blockDim.x;
    uint8_t *op;

    if (z < numSamples[index]) 
    {
        op = out + index * theOutputPacketBytes + stride * 3 * z; // Calculate op offset once

        // Load value and extract bytes directly
        int32_t val = (in + index * frameLength)[z];
        op[HBYTE] = (uint8_t)((val >> 12) & 0xffu); // Extract and assign bytes
        op[MBYTE] = (uint8_t)((val >> 4) & 0xffu);
        op[LBYTE] = (uint8_t)((val << 4) & 0xffu);
    }
}