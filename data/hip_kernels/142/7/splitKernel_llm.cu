#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void splitKernel(const unsigned int *d_In, unsigned int *d_Out, size_t size, unsigned int bitPos, unsigned int *lastValue)
{
    // Precompute commonly used values for efficiency
    int threadId = threadIdx.x + (threadIdx.y * blockDim.x);
    int blockId = (blockIdx.y * gridDim.x) + blockIdx.x;
    int threadsPerBlock = blockDim.x * blockDim.y;
    int myId = (blockId * threadsPerBlock) + threadId;

    if (myId < size) {
        // Simplified and optimized the ternary operation
        unsigned int _tmp = ((d_In[myId] >> bitPos) & 0x1) ^ 0x1;
        d_Out[myId] = _tmp;

        // Only set lastValue if it's provided and myId is the last element
        if ((lastValue != nullptr) && (myId == size - 1)) {
            *lastValue = _tmp;
        }
    }
}