#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void LinearCombinationKernel(float *input1, float input1_coeff, int input1_start_index, float *input2, float input2_coeff, int input2_start_index, float *output, int output_start_index, int size)
{
    // Improved method to calculate global thread ID for better readability
    int id = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure valid indexing of the output array
    if(id < size)
    {
        output[output_start_index + id] = input1_coeff * input1[input1_start_index + id] + input2_coeff * input2[input2_start_index + id];
    }
}