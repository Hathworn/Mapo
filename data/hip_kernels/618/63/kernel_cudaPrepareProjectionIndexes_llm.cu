#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel_cudaPrepareProjectionIndexes(char *d_v_is_projection, int *d_nearest_neighbour_indexes, int number_of_points)
{
    // Calculate global thread index
    int ind = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure valid index for processing
    if (ind < number_of_points)
    {
        // Use a single-line conditional to update nearest neighbour indexes
        d_nearest_neighbour_indexes[ind] = (d_v_is_projection[ind] == 0) ? -1 : ind;
    }
}