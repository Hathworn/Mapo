#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kern_ApplyCapacity(float* sinkBuffer, float* capBuffer, int size)
{
    int idx = CUDASTDOFFSET;

    // Ensure idx is within bounds before all operations to avoid redundant checks
    if (idx < size)
    {
        float value = sinkBuffer[idx];
        float cap = capBuffer[idx];
        
        // Utilize fmaxf and fminf for cleaner clamping
        value = fmaxf(0.0f, fminf(value, cap));
        
        sinkBuffer[idx] = value;
    }
}