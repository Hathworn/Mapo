#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void iota(int const size, int *data, int const value)
{
    // Compute global thread index
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Use grid-stride loop for improved utilization
    for (int i = idx; i < size; i += blockDim.x * gridDim.x)
    {
        data[i] = i + value;
    }
}