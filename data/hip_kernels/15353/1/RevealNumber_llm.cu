#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void RevealNumber(int* number, unsigned int number_size)
{
    // Optimize idx calculation to properly use block and grid
    unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;

    if (idx < number_size)
    {
        // Efficiently print the index and number
        printf("Index: %u, Value: %i\n", idx, number[idx]);
    }
}