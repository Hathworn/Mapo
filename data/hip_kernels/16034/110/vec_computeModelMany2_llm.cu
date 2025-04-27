#include "hip/hip_runtime.h"
#include "includes.h"

// Optimization: merged declaration sections and removed redundant declarations.

// WARNING: device_sum size should be gridDim.x
__global__ void vec_computeModelMany2(int n, int sizeImage, double* result, double* x, double* amplitude, double* background) {
    // Calculate global thread ID
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = blockDim.x * gridDim.x; // Total threads in grid

    // Loop over elements with stride to cover all elements in large data
    for (int id = tid; id < n; id += stride) {
        int id2 = id / sizeImage; // Calculate id2 considering sizeImage
        // Perform computation
        result[id] = x[id] * amplitude[id2] + background[id2];
    }
}