#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void gpu_init(int *mapad, int max, int size)
{
    // Calculate global thread position more efficiently
    int position = threadIdx.x + blockIdx.x * blockDim.x 
                 + (threadIdx.y + blockIdx.y * blockDim.y) * gridDim.x * blockDim.x; 

    if (position < size) 
    {
        mapad[position] = max;
    }
}