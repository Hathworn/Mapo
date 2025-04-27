#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel_setAllPointsToRemove(bool *d_markers, int number_of_points)
{
    int ind = blockIdx.x * blockDim.x + threadIdx.x;

    // Optimization: Use stride-based loop to handle more elements
    for (int i = ind; i < number_of_points; i += blockDim.x * gridDim.x)
    {
        d_markers[i] = false;
    }
}