#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void initializeToValue_kernel(unsigned int *data, unsigned int value, int width, int height) {
    // Calculate a unique global thread ID
    const int idx = blockIdx.x * blockDim.x + threadIdx.x;
    const int idy = blockIdx.y * blockDim.y + threadIdx.y;

    // Use a 1D index for improved memory coalescing
    int index = idy * width + idx;

    // Only proceed if indices are within bounds
    if (idx < width && idy < height) {
        data[index] = value;
    }
}