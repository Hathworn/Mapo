#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void kern_FindSinkPotentialAndStore(float* workingBuffer, float* incBuffer, float* divBuffer, float* labelBuffer, float iCC, int size)
{
    int idx = CUDASTDOFFSET;

    // Ensure idx is within bounds before accessing arrays
    if (idx < size)
    {
        float incVal = incBuffer[idx];       // Load from incBuffer
        float divVal = divBuffer[idx];       // Load from divBuffer
        float labelVal = labelBuffer[idx];   // Load from labelBuffer

        // Compute value with reduced memory access
        float value = workingBuffer[idx] + incVal - divVal + labelVal * iCC;

        // Store computed value back into workingBuffer
        workingBuffer[idx] = value;
    }
}