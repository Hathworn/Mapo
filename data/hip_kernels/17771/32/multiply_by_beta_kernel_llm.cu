#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void multiply_by_beta_kernel(float *input, float *output, float beta)
{
    // Combine thread and block ids into a single linear index for clearer range checks
    unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    unsigned int idy = blockIdx.y * blockDim.y + threadIdx.y;
    unsigned int idz = blockIdx.z * blockDim.z + threadIdx.z;

    // Use a flattened index directly, reduce computations
    unsigned long int id = (idz * c_Size.y + idy) * c_Size.x + idx;

    // Optimize boundary check logic
    if (idx < c_Size.x && idy < c_Size.y && idz < c_Size.z)
    {
        output[id] = input[id] * beta;
    }
}