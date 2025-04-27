#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void unaccumulatedPartSizesKernel(int size, int *accumulatedSize, int *sizes) {
    // Calculate the global thread index
    int idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Check if within bounds
    if (idx < size) {
        // Efficient memory access
        int prev_accumulated = (idx > 0) ? accumulatedSize[idx - 1] : 0;
        sizes[idx] = accumulatedSize[idx] - prev_accumulated;
    }
}