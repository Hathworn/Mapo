#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void ScaleArray(float *d_a, float alpha, int arraySize)
{
    // Calculate the global thread ID
    const int threadID = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Optimize by using a single loop stride within bounds
    for (int i = threadID; i < arraySize; i += blockDim.x * gridDim.x)
    {
        d_a[i] *= alpha; // Simplified multiplication
    }
}