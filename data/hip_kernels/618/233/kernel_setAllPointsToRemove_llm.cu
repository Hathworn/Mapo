```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel_setAllPointsToRemove(int number_of_points, bool *d_markers_out)
{
    // Calculate global index in a more readable way
    int ind = blockIdx.x * blockDim.x + threadIdx.x;
    if (ind < number_of_points)
    {
        d_markers_out[ind] = false;
    }
}