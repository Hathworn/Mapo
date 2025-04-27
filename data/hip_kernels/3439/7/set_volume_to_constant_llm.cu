#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void set_volume_to_constant(float * out, float value)
{
    // Calculate global index
    unsigned int i = blockIdx.x * blockDim.x + threadIdx.x;
    unsigned int j = blockIdx.y * blockDim.y + threadIdx.y;
    unsigned int k = blockIdx.z * blockDim.z + threadIdx.z;

    // Check boundary conditions with flattening to enhance memory access pattern
    if (i >= c_Size.x || j >= c_Size.y || k >= c_Size.z)
        return;

    long int id = (k * c_Size.y + j) * c_Size.x + i;

    // Writing constant value directly, which can enhance write performance
    out[id] = value;
}