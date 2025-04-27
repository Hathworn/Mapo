#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void subtract_kernel(float * in1, float * in2, float * out)
{
    // Precompute linear thread id
    unsigned int id = (blockIdx.z * blockDim.z + threadIdx.z) * c_Size.y * c_Size.x +
                      (blockIdx.y * blockDim.y + threadIdx.y) * c_Size.x +
                      (blockIdx.x * blockDim.x + threadIdx.x);

    if (id >= c_Size.x * c_Size.y * c_Size.z)
        return;

    // Perform subtraction
    out[id] = in1[id] - in2[id];
}