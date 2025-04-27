#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void multiply_by_beta_kernel(float *input, float *output, float beta)
{
    // Calculate global thread ID in 3D space
    unsigned int i = blockIdx.x * blockDim.x + threadIdx.x;
    unsigned int j = blockIdx.y * blockDim.y + threadIdx.y;
    unsigned int k = blockIdx.z * blockDim.z + threadIdx.z;
    
    // Calculate unique linear index for 3D grid
    long int id = (k * c_Size.y + j) * c_Size.x + i;

    // Check for valid index and calculate output if valid
    if (i < c_Size.x && j < c_Size.y && k < c_Size.z) {
        output[id] = input[id] * beta;
    }
}