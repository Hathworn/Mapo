#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void multiply_by_beta_kernel(float * input, float * output, float beta)
{
    // Calculate a single linear index for the 3D grid
    unsigned int idx = blockIdx.z * (gridDim.y * gridDim.x * blockDim.x * blockDim.y) +
                       blockIdx.y * (gridDim.x * blockDim.x * blockDim.y) +
                       blockIdx.x * (blockDim.x * blockDim.y) +
                       threadIdx.y * blockDim.x + threadIdx.x;
    
    // Compute stride as the total number of threads
    unsigned int stride = blockDim.x * blockDim.y * blockDim.z * gridDim.x * gridDim.y * gridDim.z;

    // Loop over all necessary elements
    for (unsigned int id = idx; id < c_Size.x * c_Size.y * c_Size.z; id += stride) {
        output[id] = input[id] * beta; // Perform the multiplication
    }
}