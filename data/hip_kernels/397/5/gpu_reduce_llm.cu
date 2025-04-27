#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void gpu_reduce(int *c, int size)
{
    // Calculate the global position of the thread
    int position = threadIdx.x + blockDim.x * (threadIdx.y + blockDim.y * (blockIdx.x + gridDim.x * blockIdx.y));

    // Optimized boundary check for in-bounds threads
    if (position < size / 2) {
        int offset = size / 2;

        // Perform reduction using the current thread's pair
        if (c[position] < c[position + offset]) {
            c[position] = c[position + offset];
        }
    }

    // Handle odd size case with a single additional comparison
    if (size % 2 != 0 && position == 0) {
        if (c[0] < c[size - 1]) {
            c[0] = c[size - 1];
        }
    }
}