#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void gpu_init(int *mapad, int max, int size)
{
    // Calculate global position using block and thread indices
    int position = blockIdx.x * blockDim.x * blockDim.y + threadIdx.y * blockDim.x + threadIdx.x;

    // Check if position is within array bounds and initialize
    if (position < size) {
        mapad[position] = max;
    }
}