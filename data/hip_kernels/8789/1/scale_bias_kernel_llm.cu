#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void scale_bias_kernel(float *output, float *biases, int n, int size)
{
    int filter = blockIdx.y;
    int batch = blockIdx.z;
    int threadId = blockIdx.x * blockDim.x + threadIdx.x;

    // Use stride loop for better occupancy and performance
    for (int offset = threadId; offset < size; offset += blockDim.x * gridDim.x)
    {
        output[(batch * n + filter) * size + offset] *= biases[filter];
    }
}