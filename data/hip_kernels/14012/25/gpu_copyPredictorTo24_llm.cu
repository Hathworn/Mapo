#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void gpu_copyPredictorTo24(int32_t *in, uint8_t *out, uint32_t stride, uint32_t *numSamples, int32_t theOutputPacketBytes, uint32_t frameLength)
{
    // Compute global thread index and restrict memory access within bounds
    int index = blockIdx.x / 8;
    int z = threadIdx.x + (blockIdx.x % 8) * blockDim.x;

    if (z < numSamples[index]) {
        // Compute output pointer offset directly from global index
        uint8_t *op = out + index * theOutputPacketBytes + stride * 3 * z;
        int32_t val = in[index * frameLength + z];

        // Efficient byte extraction using bit shifting
        op[HBYTE] = (uint8_t)((val >> 16) & 0xffu);
        op[MBYTE] = (uint8_t)((val >> 8) & 0xffu);
        op[LBYTE] = (uint8_t)(val & 0xffu);
    }
}