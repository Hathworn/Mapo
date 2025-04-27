#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void relu(float *inout, float *bias, int rows, int cols) {
    // Calculate the global index for the flattened grid
    int idx = blockIdx.y * blockDim.y * cols + blockIdx.x * blockDim.x + threadIdx.y * cols + threadIdx.x;

    // Total number of elements in the 2D grid
    int total_elements = rows * cols;

    // Iterate over the grid in a linear stride pattern
    for (; idx < total_elements; idx += blockDim.x * gridDim.x * blockDim.y * gridDim.y) {
        int i = idx / cols;  // Row index
        int j = idx % cols;  // Column index
        inout[idx] = fmaxf(0.0, inout[idx] + bias[i]);
    }
}