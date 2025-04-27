```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void subtract_kernel(float *in1, float *in2, float *out)
{
    // Compute the linear global thread ID
    unsigned int k = blockIdx.z * blockDim.z + threadIdx.z;
    unsigned int j = blockIdx.y * blockDim.y + threadIdx.y;
    unsigned int i = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Linearize the thread ID across the three dimensions
    long int id = (k * c_Size.y + j) * c_Size.x + i;
    
    // Check if the thread ID is within the valid range
    if (i < c_Size.x && j < c_Size.y && k < c_Size.z)
    {
        // Perform the subtraction operation
        out[id] = in1[id] - in2[id];
    }
}