#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void shift_cypher(unsigned int *input_array, unsigned int *output_array, unsigned int shift_amount, unsigned int alphabet_max, unsigned int array_length)
{
    // Define thread index for 1D grid
    unsigned int idx = blockDim.x * blockIdx.x + threadIdx.x;

    // Bounds check to ensure valid access
    if (idx < array_length)
    {
        // Perform shift and modulo operation for cypher
        output_array[idx] = (input_array[idx] + shift_amount) % alphabet_max;
    }
}