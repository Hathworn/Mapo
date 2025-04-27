#include "hip/hip_runtime.h"
#include "includes.h"

// Define a constant for better readability and code maintenance
#define THREADS_PER_BLOCK 256 

__global__ void kernel_setAllPointsToRemove(int number_of_points, bool *d_markers_out)
{
    int ind = blockIdx.x * blockDim.x + threadIdx.x;

    // Use strided loop for better GPU utilization
    for (int i = ind; i < number_of_points; i += blockDim.x * gridDim.x)
    {
        d_markers_out[i] = false;
    }
}