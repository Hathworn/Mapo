#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kern_PushUpSourceFlows(float* psink, float* sink, float* source, float* div, float* label, float w, float iCC, int size)
{
    int idx = CUDASTDOFFSET;

    // Ensure idx is within bounds before accessing memory
    if (idx < size)
    {
        float value = psink[idx] + w * (sink[idx] - source[idx] + div[idx] - label[idx] * iCC);
        psink[idx] = value;
    }
}