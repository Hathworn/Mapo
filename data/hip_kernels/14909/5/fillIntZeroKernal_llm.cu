#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void fillIntZeroKernal(int *_bufferPtr, int size)
{
    // Use a loop to process multiple elements per thread to improve utilization
    int idx = threadIdx.x + blockIdx.x * blockDim.x;
    int stride = gridDim.x * blockDim.x;
    
    for (int i = idx; i < size; i += stride)
    {
        _bufferPtr[i] = 0;
    }
}