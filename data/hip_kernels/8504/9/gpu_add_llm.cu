#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void gpu_add(float* first, float* second, size_t sizeFirst)
{
    // Calculate global thread index
    int threadId = threadIdx.x + blockIdx.x * blockDim.x;

    // Use stride loop pattern for better memory utilization
    for (; threadId < sizeFirst; threadId += blockDim.x * gridDim.x) {
        first[threadId] += second[threadId];
    }
}