#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void add_diff(float* a, const float* x, const float* y, const float c, int size) {
    // Calculate a linear index based on block and thread index
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    // Process only the elements within the valid range
    while (i < size) {
        a[i] += c * (x[i] - y[i]);
        // Advance to the next element in stride of grid size
        i += blockDim.x * gridDim.x;
    }
}