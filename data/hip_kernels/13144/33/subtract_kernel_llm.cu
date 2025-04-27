#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void subtract_kernel(float * in1, float * in2, float * out)
{
    // Calculate 1D flattened thread ID
    unsigned int id = (blockIdx.z * blockDim.z + threadIdx.z) * (c_Size.y * c_Size.x) +
                      (blockIdx.y * blockDim.y + threadIdx.y) * c_Size.x +
                      (blockIdx.x * blockDim.x + threadIdx.x);

    // Early exit if thread ID is out of bounds
    if (threadIdx.x >= c_Size.x || threadIdx.y >= c_Size.y || threadIdx.z >= c_Size.z)
        return;

    // Perform subtraction directly using flattened index
    out[id] = in1[id] - in2[id];
}