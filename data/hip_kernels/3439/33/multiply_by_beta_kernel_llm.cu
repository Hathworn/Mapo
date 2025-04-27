#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void multiply_by_beta_kernel(float *input, float *output, float beta)
{
    // Calculate a flat index and check bounds in a single step.
    unsigned int id = blockIdx.x * blockDim.x + threadIdx.x +
                      (blockIdx.y * blockDim.y + threadIdx.y) * c_Size.x +
                      (blockIdx.z * blockDim.z + threadIdx.z) * c_Size.x * c_Size.y;

    if (id < c_Size.x * c_Size.y * c_Size.z) {
        output[id] = input[id] * beta; // Perform the multiplication.
    }
}