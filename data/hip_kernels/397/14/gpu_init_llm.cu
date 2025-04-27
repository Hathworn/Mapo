#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void gpu_init(int *mapad, int max, int size)
{
    // Calculate global thread position in flattened array
    int threadId = blockIdx.y * gridDim.x * blockDim.x * blockDim.y + blockIdx.x * blockDim.x * blockDim.y +
                   threadIdx.y * blockDim.x + threadIdx.x;

    // Assign value to array position if within bounds
    if (threadId < size) {
        mapad[threadId] = max;
    }
}