#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void LinearCombinationKernel(float *input1, float input1_coeff, int input1_start_index, float *input2, float input2_coeff, int input2_start_index, float *output, int output_start_index, int size)
{
    // Calculate the global thread index using a flattened 1D grid
    int id = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure we are operating within the size bound
    if (id < size)
    {
        // Perform the linear combination
        output[output_start_index + id] = input1_coeff * input1[input1_start_index + id] + input2_coeff * input2[input2_start_index + id];
    }
}