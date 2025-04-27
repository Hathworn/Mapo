#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void scale_bias_kernel(float *output, float *biases, int n, int size)
{
    // Calculate indices for x, y, z dimensions
    int idx = blockIdx.x * blockDim.x + threadIdx.x;  // Improved naming for readibility
    int filter = blockIdx.y;
    int batch = blockIdx.z;

    // Check boundary condition
    if (idx < size) {
        // Calculate the linear position in the output array
        int linear_idx = (batch * n + filter) * size + idx;
        // Multiply the output by the corresponding bias
        output[linear_idx] *= biases[filter];
    }
}