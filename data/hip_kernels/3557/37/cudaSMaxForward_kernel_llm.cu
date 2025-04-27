#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cudaSMaxForward_kernel(unsigned int size, float* input, float* maxVal, const unsigned int idx, unsigned int* argMax)
{
    const unsigned int index = blockIdx.x * blockDim.x + threadIdx.x;
    const unsigned int stride = blockDim.x * gridDim.x;

    // Use shared memory to reduce global memory accesses
    __shared__ float sharedMax;
    __shared__ unsigned int sharedIdx;

    if(threadIdx.x == 0) {
        sharedMax = -FLT_MAX; // Initialize with smallest possible float value
        sharedIdx = 0;
    }
    __syncthreads();

    float localMax = sharedMax;
    unsigned int localIdx = sharedIdx;

    for (unsigned int i = index; i < size; i += stride) {
        if (input[i] > localMax) {
            localMax = input[i];
            localIdx = idx;
        }
    }

    if(threadIdx.x == 0) {
        sharedMax = localMax;
        sharedIdx = localIdx;
    }
    __syncthreads();

    for (unsigned int i = index; i < size; i += stride) {
        if (sharedMax > maxVal[i]) {
            maxVal[i] = sharedMax;
            argMax[i] = sharedIdx;
        }
    }
}