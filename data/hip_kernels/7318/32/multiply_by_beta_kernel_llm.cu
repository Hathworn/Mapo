#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void multiply_by_beta_kernel(float * input, float * output, float beta)
{
    // Optimize block and thread indexing by using a flat index
    unsigned long int id = blockIdx.z * (gridDim.y * gridDim.x) * blockDim.x * blockDim.y
                         + blockIdx.y * (gridDim.x * blockDim.x * blockDim.y)
                         + blockIdx.x * (blockDim.x * blockDim.y)
                         + threadIdx.z * (blockDim.x * blockDim.y)
                         + threadIdx.y * blockDim.x
                         + threadIdx.x;

    if (id < (c_Size.x * c_Size.y * c_Size.z))
    {
        output[id] = input[id] * beta; // Directly perform calculation for valid threads
    }
}