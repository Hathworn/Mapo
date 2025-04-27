#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cudaFillArray(float *gpu_array, float val, int N)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x; // Combine blockIdx.x and threadIdx.x for 1D grid
    int stride = gridDim.x * blockDim.x; // Calculate stride for each block

    for (; i < N; i += stride) // Use loop to handle larger arrays
    {
        gpu_array[i] = val;
    }
}