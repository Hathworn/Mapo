```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void initializeToValue_kernel(unsigned int *data, unsigned int value, int width, int height) {
    // Calculate 1D index based on 2D grid dimensions
    const int idx = blockIdx.x * blockDim.x + threadIdx.x;
    const int offset = gridDim.x * blockDim.x; // Total number of threads in a row

    // Iterate over all elements row by row
    for (int i = idx; i < width * height; i += offset) {
        data[i] = value;
    }
}