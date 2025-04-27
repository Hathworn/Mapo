#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel_setAllPointsToRemove(bool *d_markers, int number_of_points)
{
    // Calculate global thread index
    int ind = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Improved bounds check to eliminate redundant thread execution
    if (ind < number_of_points)
    {
        d_markers[ind] = false; // Directly set marker to false
    }
}