```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void add_bias_kernel(float *output, float *biases, int n, int size)
{
    int offset = blockIdx.x * blockDim.x + threadIdx.x;
    int filter = blockIdx.y;
    int batch = blockIdx.z;

    // Check that both offset and filter are in bounds
    if (offset < size && filter < n) {
        // Compute the linear index and add bias
        output[(batch * n + filter) * size + offset] += biases[filter];
    }
}