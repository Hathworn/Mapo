#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kern_PropogateUp(float* working, int span, int imageSize)
{
    int idx = CUDASTDOFFSET;

    // Ensure idx+span is within bounds first to avoid unnecessary work
    if (idx + span < imageSize)
    {
        // Initialize shared variables for better memory access
        float inputValue1 = working[idx];
        float inputValue2 = working[idx + span];
        
        // Calculate output value using conditional operator
        float outputVal = (inputValue1 > inputValue2) ? inputValue1 : inputValue2;

        // Update working array
        working[idx] = outputVal;
    }
}