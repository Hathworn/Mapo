#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void kern_ResetSinkBuffer(float* sink, float* source, float* div, float* label, float ik, float iCC, int size)
{
    int idx = CUDASTDOFFSET;
    if (idx < size)
    {
        // Consolidated calculation into single expression
        sink[idx] = (1.0f - ik) * sink[idx] + ik * (source[idx] - div[idx] + label[idx] * iCC);
    }
}