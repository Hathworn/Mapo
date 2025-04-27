#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void gpu_copyPredictorTo32(int32_t * in, int32_t * out, uint32_t stride, uint32_t * numSamples, int32_t theOutputPacketBytes, uint32_t frameLength)
{
    int block = blockIdx.x % 8;
    int index = blockIdx.x / 8;
    int z = threadIdx.x + block * blockDim.x;

    if (z < numSamples[index])
    {
        int32_t * op = out + (index * theOutputPacketBytes) / 4;

        // Coalesced memory access by using only one pointer arithmetic
        int32_t * inputBase = in + index * frameLength; // Pre-compute input base pointer
        op[stride * z] = inputBase[z];
    }
}