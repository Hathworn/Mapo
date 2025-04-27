#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void kern_DivideBuffers(float* dst, float* src, const int size)
{
    int idx = CUDASTDOFFSET;

    // Only process if index is within bounds
    if (idx < size)
    {
        float value1 = src[idx];
        float value2 = dst[idx];

        // Prevent division by zero
        if (value1 != 0)
        {
            dst[idx] = value2 / value1;
        }
    }
}