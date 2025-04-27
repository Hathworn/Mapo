#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void gpu_init(int *mapad, int max, int size)
{
    // Calculate global linear thread index
    int position = blockIdx.x * blockDim.x * blockDim.y 
                 + blockIdx.y * gridDim.x * blockDim.x * blockDim.y 
                 + threadIdx.y * blockDim.x + threadIdx.x;

    // Bounds check
    if (position < size) {
        mapad[position] = max;
    }
}