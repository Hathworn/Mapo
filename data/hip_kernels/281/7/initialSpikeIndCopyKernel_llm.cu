#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void initialSpikeIndCopyKernel(unsigned short* pLastSpikeInd, const unsigned int noReal, const unsigned int noSpikes) 
{
    unsigned int globalIndex = blockIdx.x * blockDim.x + threadIdx.x;
    if (globalIndex < noReal * noSpikes) {
        // Calculate spike number efficiently
        unsigned int spikeNo = globalIndex / noReal;
        // Efficiently copy spike index
        pLastSpikeInd[globalIndex] = __ldg(&pLastSpikeInd[spikeNo * noReal]);
    }
}