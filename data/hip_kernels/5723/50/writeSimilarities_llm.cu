#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void writeSimilarities(const float* nvccResults, int* activelayers, int writestep, int writenum, float* similarities, int active_slices, int slices)
{
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Ensure thread id is within bounds
    if (tid < active_slices)
    {
        float res = nvccResults[tid];
        int slice = activelayers[tid];
        
        // Use a pointer offset to access memory more efficiently
        float* simPtr = similarities + slice;
        for (int i = 0; i < writenum; ++i)
        {
            *(simPtr + slices * writestep * i) = res;
        }
    }
}