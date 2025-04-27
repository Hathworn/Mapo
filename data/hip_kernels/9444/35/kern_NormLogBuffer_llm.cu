#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kern_NormLogBuffer(float* agreement, float* output, float maxOut, int size, short max)
{
    int idx = CUDASTDOFFSET;
    if (idx < size) {  // Ensure idx is within bounds
        float locAgreement = agreement[idx];
        float logValue = (locAgreement > 0.0f) ? log((float)max) - log(locAgreement) : maxOut;

        // Bound logValue within [0, maxOut] and scale
        if (logValue < 0.0f) logValue = 0.0f;
        else if (logValue > maxOut) logValue = 1.0f;
        else logValue /= maxOut;

        output[idx] = logValue;
    }
}