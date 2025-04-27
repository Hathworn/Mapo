#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void kern_Lbl(float* lbl, float* flo, float* cap, const int size)
{
    int idx = CUDASTDOFFSET;
    // Ensure index is within bounds before executing logic
    if (idx < size)
    {
        float value1 = cap[idx];
        float value2 = flo[idx];
        lbl[idx] = (value2 == value1) ? 1.0f : 0.0f; // Simplified conditional assignment
    }
}