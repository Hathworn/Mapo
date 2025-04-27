#include "hip/hip_runtime.h"
#include "includes.h"
#define CUDASTDOFFSET (blockIdx.x * blockDim.x + threadIdx.x)

__global__ void kern_FindSourcePotentialAndStore(float* workingBuffer, float* sinkBuffer, float* divBuffer, float* labelBuffer, float iCC, int size)
{
    int idx = CUDASTDOFFSET;
  
    // Ensure index is within bounds before accessing memory
    if (idx < size) 
    {
        float value = workingBuffer[idx] + sinkBuffer[idx] + divBuffer[idx] - labelBuffer[idx] * iCC;
        workingBuffer[idx] = value;
    }
}