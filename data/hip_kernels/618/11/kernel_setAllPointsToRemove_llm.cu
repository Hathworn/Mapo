#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel_setAllPointsToRemove(bool *d_markers, int number_of_points)
{
    int ind = blockIdx.x * blockDim.x + threadIdx.x;
    if (ind < number_of_points)
    {
        // Utilize coalesced memory access
        d_markers[ind] = false;
    }
}