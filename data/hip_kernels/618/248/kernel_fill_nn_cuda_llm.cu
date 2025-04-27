#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel_fill_nn_cuda(unsigned int *d_nn, int *nearest_neighbour_indexes, unsigned int number_nearest_neighbour_indexes)
{
    int ind = blockIdx.x * blockDim.x + threadIdx.x;

    // Check within bounds to avoid branching inside conditional
    if (ind < number_nearest_neighbour_indexes)
    {
        d_nn[ind] = (nearest_neighbour_indexes[ind] < 0) ? 0 : 1;  // Use ternary operator for conciseness
    }
}