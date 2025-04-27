#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void kern_PropogateDown(float* working, int span, int imageSize)
{
    int idx = CUDASTDOFFSET;
    // Check bounds before memory access to avoid redundant indexing
    if (idx + span < imageSize)
    {
        float inputValue1 = working[idx];
        float inputValue2 = working[idx + span];
        // Minimize directly to avoid additional branching
        working[idx] = fminf(inputValue1, inputValue2);
    }
}