#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kern_Copy2Buffers(float* fIn, float* fOut1, float* fOut2, int size)
{
    int idx = CUDASTDOFFSET;
    // Check boundary condition once and compute memory address
    if( idx < size )
    {
        float value = fIn[idx];
        fOut1[idx] = value;
        fOut2[idx] = value;
    }
}