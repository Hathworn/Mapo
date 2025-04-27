#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void bitflip_kernel(float* M, int height, int row, int n) {
    // Calculate the global index
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Check if the index is within the bounds
    if (idx < n) {
        // Pre-calculate the row offset
        int offset_row = row * height;

        // Loop with stride optimization
        for (unsigned int i = idx; i < n; i += gridDim.x * blockDim.x) {
            M[i * height + offset_row] = 1.0f - M[i * height + offset_row];
        }
    }
}