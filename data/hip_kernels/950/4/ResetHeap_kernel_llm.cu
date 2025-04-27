#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void ResetHeap_kernel(int *mplHeap, int *mplHeapPtr, int numBlock)
{
    int index = threadIdx.x + blockDim.x * blockIdx.x;
    if (index >= numBlock)
        return;

    // Initialize heap pointer only once outside the loop
    if (index == 0) 
    {
        mplHeapPtr[0] = numBlock - 1;
    }

    // Calculate heap index more efficiently
    mplHeap[index] = numBlock - index - 1;
}