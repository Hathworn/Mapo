```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void scale_bias_kernel(float *output, float *biases, int n, int size)
{
    int offset = blockIdx.x * blockDim.x + threadIdx.x;
    int filter = blockIdx.y;
    int batch = blockIdx.z;

    // Use shared memory to store biases to reduce global memory access
    __shared__ float shared_biases[1024]; // Assuming max 1024 filters

    if (threadIdx.x == 0) {
        shared_biases[filter] = biases[filter];
    }

    // Synchronize to ensure biases are loaded
    __syncthreads();

    // Use shared bias for multiplication
    if(offset < size) output[(batch * n + filter) * size + offset] *= shared_biases[filter];
}