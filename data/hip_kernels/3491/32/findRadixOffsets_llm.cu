#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void findRadixOffsets(uint2* keys, uint* counters, uint* blockOffsets, uint startbit, uint numElements, uint totalBlocks)
{
    __shared__ uint sStartPointers[16];
    extern __shared__ uint sRadix1[];

    uint groupId = blockIdx.x;
    uint localId = threadIdx.x;
    uint groupSize = blockDim.x;

    uint2 radix2 = keys[threadIdx.x + (blockIdx.x * blockDim.x)];

    // Store radix values in shared memory
    sRadix1[2 * localId]     = (radix2.x >> startbit) & 0xF;
    sRadix1[2 * localId + 1] = (radix2.y >> startbit) & 0xF;

    if (localId < 16)
    {
        sStartPointers[localId] = 0;
    }
    __syncthreads();

    // Use built-in warp functions for divergence detection
    if(localId < 2 * groupSize)
    {
        uint pos = (localId > 0 && sRadix1[localId] != sRadix1[localId - 1]) ? localId : 0;
        atomicMax(&sStartPointers[sRadix1[localId]], pos);
    }
    __syncthreads();

    if (localId < 16)
    {
        blockOffsets[groupId * 16 + localId] = sStartPointers[localId];
    }
    __syncthreads();

    // Calculate sizes of each block
    if(localId < 2 * groupSize)
    {
        uint prev = sRadix1[localId - 1];
        uint size = localId > 0 ? localId - sStartPointers[prev] : 0;
        if(prev != sRadix1[localId])
        {
            atomicMin(&sStartPointers[prev], size);
        }
    }

    if(localId == 2 * groupSize - 1)
    {
        uint last = sRadix1[localId];
        sStartPointers[last] = 2 * groupSize - sStartPointers[last];
    }
    __syncthreads();

    if(localId < 16)
    {
        counters[localId * totalBlocks + groupId] = sStartPointers[localId];
    }
}