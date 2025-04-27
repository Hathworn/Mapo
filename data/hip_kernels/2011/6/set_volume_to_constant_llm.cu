#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void set_volume_to_constant(float * out, float value)
{
    // Combine i, j, k calculation to improve efficiency
    unsigned long id = (blockIdx.z * blockDim.z + threadIdx.z) * c_Size.y * c_Size.x +
                       (blockIdx.y * blockDim.y + threadIdx.y) * c_Size.x +
                       (blockIdx.x * blockDim.x + threadIdx.x);

    // Use early return to reduce thread work
    if (blockIdx.x * blockDim.x + threadIdx.x >= c_Size.x || 
        blockIdx.y * blockDim.y + threadIdx.y >= c_Size.y || 
        blockIdx.z * blockDim.z + threadIdx.z >= c_Size.z)
        return;

    out[id] = value;
}