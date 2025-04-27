#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void subtract_kernel(float * in1, float * in2, float * out)
{
    // Calculate linear thread ID
    unsigned int id = blockIdx.z * blockDim.z * c_Size.y * c_Size.x +
                      blockIdx.y * blockDim.y * c_Size.x +
                      blockIdx.x * blockDim.x +
                      threadIdx.z * c_Size.y * c_Size.x +
                      threadIdx.y * c_Size.x +
                      threadIdx.x;

    // Check if id is within bounds
    if (id >= c_Size.x * c_Size.y * c_Size.z)
        return;

    // Perform subtraction
    out[id] = in1[id] - in2[id];
}