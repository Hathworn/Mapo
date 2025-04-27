```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void gpu_copyPredictorTo24Shift(int32_t * in, uint16_t * shift, uint8_t * out, uint32_t stride, uint32_t * numSamples, int32_t bytesShifted, int32_t theOutputPacketBytes, uint32_t frameLength)
{
    // Calculate a single linear thread index for optimizing memory access patterns
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    int index = idx / (8 * blockDim.x);  // Calculate index from linear idx
    int block = idx % (8 * blockDim.x) / blockDim.x;  // Calculate block from linear idx
    int z = idx % blockDim.x + block * blockDim.x;

    if (z < numSamples[index])
    {
        uint8_t * op = out + (index * theOutputPacketBytes);
        int32_t shiftVal = bytesShifted * 8;

        int32_t val = (in + index * frameLength)[z];
        val = (val << shiftVal) | (uint32_t)(shift + index * frameLength * 2)[z];

        op += (stride * 3 * z);
        op[HBYTE] = (uint8_t)((val >> 16) & 0xffu);
        op[MBYTE] = (uint8_t)((val >> 8) & 0xffu);
        op[LBYTE] = (uint8_t)((val >> 0) & 0xffu);
    }
}