#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void subtract_kernel(float * in1, float * in2, float * out)
{
    // Calculate the global index of each thread using only one calculation
    unsigned long int id = (blockIdx.z * blockDim.z + threadIdx.z) * c_Size.y * c_Size.x +
                           (blockIdx.y * blockDim.y + threadIdx.y) * c_Size.x +
                           (blockIdx.x * blockDim.x + threadIdx.x);

    // Check if index is within bounds
    if (blockIdx.x * blockDim.x + threadIdx.x < c_Size.x && 
        blockIdx.y * blockDim.y + threadIdx.y < c_Size.y && 
        blockIdx.z * blockDim.z + threadIdx.z < c_Size.z) 
    {
        // Perform the subtraction operation
        out[id] = in1[id] - in2[id];
    }
}