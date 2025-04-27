#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void set_volume_to_constant(float *out, float value)
{
    // Use combined index calculation to reduce arithmetic operations
    unsigned int index = blockIdx.z * (gridDim.y * gridDim.x * blockDim.y * blockDim.x) +
                         blockIdx.y * (gridDim.x * blockDim.x) + 
                         blockIdx.x * blockDim.x +
                         threadIdx.z * (blockDim.y * blockDim.x) +
                         threadIdx.y * blockDim.x + 
                         threadIdx.x;

    unsigned int i = index % c_Size.x;
    unsigned int j = (index / c_Size.x) % c_Size.y;
    unsigned int k = index / (c_Size.x * c_Size.y);

    if (i >= c_Size.x || j >= c_Size.y || k >= c_Size.z)
        return;

    out[index] = value; // Directly use calculated index
}