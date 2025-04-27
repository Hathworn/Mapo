#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void reorderData(uint startbit, uint *outKeys, uint *outValues, uint2 *keys, uint2 *values, uint *blockOffsets, uint *offsets, uint *sizes, uint totalBlocks)
{
    uint GROUP_SIZE = blockDim.x;
    __shared__ uint2 sKeys2[256];
    __shared__ uint2 sValues2[256];
    __shared__ uint sOffsets[16];
    __shared__ uint sBlockOffsets[16];
    uint* sKeys1   = (uint*) sKeys2;
    uint* sValues1 = (uint*) sValues2;

    uint blockId = blockIdx.x;
    uint i = blockId * blockDim.x + threadIdx.x;

    sKeys2[threadIdx.x]   = keys[i];
    sValues2[threadIdx.x] = values[i];

    if(threadIdx.x < 16)
    {
        sOffsets[threadIdx.x]      = offsets[threadIdx.x * totalBlocks + blockId];
        sBlockOffsets[threadIdx.x] = blockOffsets[blockId * 16 + threadIdx.x];
    }
    __syncthreads();

    // Reduce repeated calculations of radix and globalOffset
    for (int step = 0; step < 2; ++step) {
        uint idx = threadIdx.x + step * GROUP_SIZE;
        uint radix = (sKeys1[idx] >> startbit) & 0xF;
        uint globalOffset = sOffsets[radix] + idx - sBlockOffsets[radix];
        
        outKeys[globalOffset] = sKeys1[idx];
        outValues[globalOffset] = sValues1[idx];
    }
}