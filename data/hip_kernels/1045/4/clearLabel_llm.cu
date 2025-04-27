#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void clearLabel(bool *label, unsigned int size)
{
    // Use the grid stride loop for better scalability across different GPU architectures
    for (unsigned int id = blockIdx.x * blockDim.x + threadIdx.x; id < size; id += blockDim.x * gridDim.x)
    {
        label[id] = false;
    }
}