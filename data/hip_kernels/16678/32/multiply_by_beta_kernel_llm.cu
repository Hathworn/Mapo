```c
#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void multiply_by_beta_kernel(float * input, float * output, float beta)
{
    // Calculate global thread index in a 1D flattened space for better memory access
    unsigned int id = (blockIdx.z * gridDim.y * gridDim.x + blockIdx.y * gridDim.x + blockIdx.x) * blockDim.z * blockDim.y * blockDim.x
                      + (threadIdx.z * blockDim.y * blockDim.x + threadIdx.y * blockDim.x + threadIdx.x);

    // Check against total size instead of individual dimensions
    long int total_size = c_Size.x * c_Size.y * c_Size.z;
    if (id >= total_size) return;

    // Update output using computed linear index
    output[id] = input[id] * beta;
}