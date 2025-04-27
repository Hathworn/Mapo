#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void set_volume_to_constant(float * out, float value)
{
    // Calculate global linear thread index for improved performance.
    unsigned int id = blockIdx.z * blockDim.z * c_Size.y * c_Size.x +
                      blockIdx.y * blockDim.y * c_Size.x +
                      blockIdx.x * blockDim.x + 
                      threadIdx.z * c_Size.y * c_Size.x +
                      threadIdx.y * c_Size.x +
                      threadIdx.x;
    
    // Ensure we only write to valid indices.
    if (id >= c_Size.x * c_Size.y * c_Size.z)
        return;

    // Set the output to the constant value.
    out[id] = value;
}