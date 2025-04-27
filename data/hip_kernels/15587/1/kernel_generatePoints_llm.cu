```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel_generatePoints(hiprandState *globalState, int *counts, int totalNumThreads)
{
    int index = (blockIdx.x * blockDim.x) + threadIdx.x;
    if (index >= totalNumThreads)
    {
        return;
    }

    // Load the state from global memory once
    hiprandState localState = globalState[index];
    int localCount = 0;
    
    for (int i = 0; i < NUM_POINTS_PER_THREAD; i++)
    {
        float x = hiprand_uniform(&localState);
        float y = hiprand_uniform(&localState);
        if (x * x + y * y <= 1)
        {
            localCount++;
        }
    }
    
    // Write the result back to global memory once
    counts[index] = localCount;
    // Store the state back to global memory once
    globalState[index] = localState;
}