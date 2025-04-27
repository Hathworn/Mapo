#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void LinearValuesKernel(const float min, const float max, float* output, const int size, const int shift)
{
    int id = blockDim.x * (blockIdx.y * gridDim.x + blockIdx.x) + threadIdx.x;

    // Calculate delta once and broadcast to all threads
    float delta = (max - min) / fmaxf((size - 1), 1);
    
    if (id < size)
    {
        output[(id + shift) % size] = min + id * delta;
    }
}