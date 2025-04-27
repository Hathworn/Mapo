#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kern_ProbBuffer(float* agreement, float* output, int size, short max)
{
    int idx = CUDASTDOFFSET;
    if (idx < size)  // Early exit for threads not needed
    {
        float locAgreement = agreement[idx];
        float probValue = fminf(locAgreement / (float)max, 1.0f);  // Use fminf for clamping
        output[idx] = probValue;
    }
}