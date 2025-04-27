#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void multiply_by_beta_kernel(float *input, float *output, float beta)
{
    // Calculate the flattened global id for the 3D grid
    unsigned int id = (blockIdx.z * blockDim.z + threadIdx.z) * c_Size.y * c_Size.x +
                      (blockIdx.y * blockDim.y + threadIdx.y) * c_Size.x +
                      (blockIdx.x * blockDim.x + threadIdx.x);

    // Check if within bounds, leveraging short-circuit evaluation
    if (blockIdx.x * blockDim.x + threadIdx.x < c_Size.x &&
        blockIdx.y * blockDim.y + threadIdx.y < c_Size.y &&
        blockIdx.z * blockDim.z + threadIdx.z < c_Size.z)
    {
        output[id] = input[id] * beta;
    }
}
```
