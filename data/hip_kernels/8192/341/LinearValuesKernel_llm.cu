#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void LinearValuesKernel(const float min, const float max, float* output, const int size, const int shift)
{
    int id = blockDim.x * (blockIdx.y * gridDim.x + blockIdx.x) + threadIdx.x;

    __shared__ float delta; // Shared memory for delta calculation

    if (threadIdx.x == 0) 
        delta = (max - min) / fmaxf((size - 1), 1);
    __syncthreads();

    if (id < size)
    {
        output[(id + shift) % size] = min + id * delta; // Compute output using shared delta
    }
}