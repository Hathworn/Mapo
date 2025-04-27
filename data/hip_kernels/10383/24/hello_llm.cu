#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void hello()
{
    // Use a grid-stride loop to improve parallel efficiency
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    int gridSize = blockDim.x * gridDim.x;

    for (int i = idx; i < gridSize; i += gridSize) {
        printf("Hello world! I'm thread %d\n", i);
    }
}