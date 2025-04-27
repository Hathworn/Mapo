#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kern_FindLeafSinkPotential(float* sinkBuffer, float* incBuffer, float* divBuffer, float* labelBuffer, float iCC, int size)
{
    int idx = CUDASTDOFFSET;
    // Check if idx is within bounds before accessing arrays to avoid redundant computation
    if (idx < size)
    {
        float value = incBuffer[idx] - divBuffer[idx] + labelBuffer[idx] * iCC;
        sinkBuffer[idx] = value;
    }
}