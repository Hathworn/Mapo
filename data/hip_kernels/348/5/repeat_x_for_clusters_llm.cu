#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void repeat_x_for_clusters(float * x, int size)
{
    // Calculate global index only once
    int index = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Check if the index is valid and perform the operation
    if (index < size)
    {
        x[index] = x[threadIdx.x];
    }
}