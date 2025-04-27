#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel_copy_NN_with_NN_assuption(double *d_temp_double_mem, int *d_nearest_neighbour_indexes, int number_of_points)
{
    // Calculate global thread index
    int index = blockIdx.x * blockDim.x + threadIdx.x;

    // Use branchless computing for better performance
    if(index < number_of_points)
    {
        int i = d_nearest_neighbour_indexes[index];
        d_temp_double_mem[index] = (i != -1) ? 1.0 : 0.0;
    }
}