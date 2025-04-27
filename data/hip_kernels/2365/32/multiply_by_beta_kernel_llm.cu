#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized global kernel function
__global__ void multiply_by_beta_kernel(float *input, float *output, float beta)
{
    unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    unsigned int idy = blockIdx.y * blockDim.y + threadIdx.y;
    unsigned int idz = blockIdx.z * blockDim.z + threadIdx.z;

    // Calculate unique identifier for the thread
    long int id = (idz * c_Size.y + idy) * c_Size.x + idx;

    // Check indices and perform multiplication
    if (idx < c_Size.x && idy < c_Size.y && idz < c_Size.z)
    {
        output[id] = input[id] * beta;
    }
}