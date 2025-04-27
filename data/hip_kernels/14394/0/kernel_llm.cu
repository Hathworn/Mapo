#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized global kernel function
extern "C"
__global__ void kernel(int* data, int size)
{
    int id = blockDim.x * blockIdx.x + threadIdx.x;
    if (id < size) // Ensure thread operates within data boundaries
    {
        data[id] = id;
    }
}