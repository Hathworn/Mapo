#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void gpu_reduce(int *c, int size)
{
    // Calculate global thread position
    int position = blockDim.x * blockDim.y * ((blockIdx.y * gridDim.x) + blockIdx.x) + ((threadIdx.y * blockDim.x) + threadIdx.x);

    // Check if position is within bounds
    if (position < size / 2) {  // Only process half the size
        // Perform reduction for even-sized arrays
        if (c[position] < c[position + size / 2]) {
            c[position] = c[position + size / 2];
        }
    }

    // Handle odd size by checking last element separately
    if (size % 2 != 0 && position == 0) {  // Only the first thread checks this
        if (c[0] < c[size - 1]) {
            c[0] = c[size - 1];
        }
    }
}