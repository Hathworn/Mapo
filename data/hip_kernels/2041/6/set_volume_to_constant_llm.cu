#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void set_volume_to_constant(float * out, float value)
{
    unsigned int i = blockIdx.x * blockDim.x + threadIdx.x;
    unsigned int j = blockIdx.y * blockDim.y + threadIdx.y;
    unsigned int k = blockIdx.z * blockDim.z + threadIdx.z;

    // Use early exit to reduce nesting and improve readability
    if (i < c_Size.x && j < c_Size.y && k < c_Size.z) 
    {
        long int id = (k * c_Size.y + j) * c_Size.x + i;
        out[id] = value;
    }
}