#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel_copy_NN_with_NN_assuption(double *d_temp_double_mem, int *d_nearest_neighbour_indexes, int number_of_points)
{
    int index = blockIdx.x * blockDim.x + threadIdx.x;

    // Load d_nearest_neighbour_indexes[index] into a register to reduce repeated global memory access
    if (index < number_of_points) {
        int i = d_nearest_neighbour_indexes[index];
        d_temp_double_mem[index] = (i != -1) ? 1.0f : 0.0f; // Use a ternary operator for simplicity
    }
}