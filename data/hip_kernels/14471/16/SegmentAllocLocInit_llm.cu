#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void SegmentAllocLocInit(ushort2* gSegments, const uint32_t segmentCount)
{
    unsigned int globalId = blockIdx.x * blockDim.x + threadIdx.x;
    if(globalId < segmentCount) // Directly check if within range
    {
        ushort2 defaultVal = {0xFFFF, 0xFFFF}; // Use a single default value assignment
        gSegments[globalId] = defaultVal; // More concise assignment
    }
}