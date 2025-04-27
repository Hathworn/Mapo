#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void multiply_by_beta_kernel(float *input, float *output, float beta)
{
    unsigned int i = blockIdx.x * blockDim.x + threadIdx.x;
    unsigned int j = blockIdx.y * blockDim.y + threadIdx.y;
    unsigned int k = blockIdx.z * blockDim.z + threadIdx.z;

    // Use flat indexing to improve memory access efficiency
    long int id = ((k * c_Size.y + j) * c_Size.x + i);

    if (id < c_Size.x * c_Size.y * c_Size.z)  // Check within bounds for a flat array
        output[id] = input[id] * beta;
}